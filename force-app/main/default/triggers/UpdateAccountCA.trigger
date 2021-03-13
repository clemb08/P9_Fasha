trigger UpdateAccountCA on Order (after update) {
    
    //All the logic is in the helper Class
    AP02_UpdateCAWithOrders.updateCAWithOrdersTotalAmount(Trigger.new);

}