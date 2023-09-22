module MathModule {
    @ Port for requesting an operation on two numbers
    port OpRequest (
        val1: F32 @< The first operand
        op: MathOp @< the operation
        val2: F32 @< The second operand
    )

    port MathResult (
        result: F32 @< the result of the operation
    )
}