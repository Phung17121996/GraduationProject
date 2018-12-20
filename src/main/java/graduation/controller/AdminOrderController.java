package graduation.controller;

import graduation.entity.OrderDetailEntity;
import graduation.entity.OrdersEntity;
import graduation.entity.StateEntity;
import graduation.repository.OrderDetailRepository;
import graduation.repository.OrdersRepository;
import graduation.repository.StateRepository;
import graduation.util.AdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminOrderController {
    @Autowired
    OrdersRepository ordersRepository;
    @Autowired
    StateRepository stateRepository;
    @Autowired
    OrderDetailRepository orderDetailRepository;

    @RequestMapping("admin_order")
    public String showOrders(Model model, HttpServletRequest request){
        if (!AdminUtil.checkRoleAdmin(request)) {
            return "404";
        }
        List<OrdersEntity> orders= (List<OrdersEntity>) ordersRepository.getOrdersDESC();
        model.addAttribute("orders", orders);
        return "admin_order";
    }

    @RequestMapping("detailOrder")
    public String viewOrder(@RequestParam(name = "id") int id,
                            Model model, HttpServletRequest request){
        if (!AdminUtil.checkRoleAdmin(request)) {
            return "404";
        }
        OrdersEntity order= (OrdersEntity) ordersRepository.findOne(id);
        List<OrderDetailEntity> orderDetailList= orderDetailRepository.getOrderDetailByOrdersId(id);

        if(!order.getStateEntity().getStateName().equalsIgnoreCase("Canceled")){
            List<StateEntity> states= stateRepository.getStates(order.getStateEntity().getId());
            model.addAttribute("states", states);
        }
        model.addAttribute("order", order);
        model.addAttribute("orderDetailList", orderDetailList);
        return "admin_orderdetail";
    }

    @RequestMapping("updateOrder")
    public String updateOrder(@RequestParam(name = "id") int id,
                              @RequestParam(name = "state") int stateId,
                              HttpServletRequest request){
        if (!AdminUtil.checkRoleAdmin(request)) {
            return "404";
        }
        OrdersEntity order= (OrdersEntity) ordersRepository.findOne(id);
        StateEntity stateEntity= stateRepository.findOne(stateId);
        order.setStateEntity(stateEntity);
        ordersRepository.save(order);
        return "redirect:admin_order";
    }
}
