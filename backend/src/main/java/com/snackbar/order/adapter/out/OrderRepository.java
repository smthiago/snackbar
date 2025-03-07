package com.snackbar.order.adapter.out;

import com.snackbar.order.domain.model.Order;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface OrderRepository extends MongoRepository<Order, String> {
    Optional<Order> findTopByOrderByOrderNumberDesc();
    Optional<Order> findByOrderNumber(String orderNumber);
}
