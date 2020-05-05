package pl.hatex.hatex.services.Impl;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.entity.User;
import pl.hatex.hatex.repository.OrderRepository;
import pl.hatex.hatex.repository.UserRepository;
import pl.hatex.hatex.services.OrderService;

import java.time.LocalDateTime;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    public OrderServiceImpl(OrderRepository orderRepository, UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
    }

    @Override
    public void saveOrder(Order order) {
        String time = String.valueOf(LocalDateTime.now());
        order.setCreated(time);
        order.setUpdated(time);
        order.setProgress(0);
        orderRepository.save(order);

    }

    @Override
    public void update(Order order) {
        String time = String.valueOf(LocalDateTime.now());
        order.setUpdated(time);
        orderRepository.save(order);
    }

    @Override
    public void deleteOrder(long id) {
        orderRepository.deleteById(id);
    }
}