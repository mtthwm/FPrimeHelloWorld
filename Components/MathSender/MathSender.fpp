module MathModule {
    @ Active component used for sending operations and operrands to the MathReceiver
    active component MathSender {

        # ----------------------------
        # General Ports
        # ----------------------------

        @ Port for sending the operation request
        output port mathOpOut: OpRequest

        @ Port for receiving the result
        async input port mathResultIn: MathResult

        # ---------------------
        # Commands
        # ---------------------

        @ Do a math operation
        async command DO_MATH(
            val1: F32 @< The first operand
            op: MathOp @< The operation
            val2: F32 @< The second operand
        )

        # ------------------------
        # Events
        # ------------------------

        @ Math command received
        event COMMAND_RECV(
            val1: F32 @< The first operand
            op: MathOp @< The operation
            val2: F32 @< The second operand
        ) \ 
        severity activity low \
        format "Math command received: {f} {} {f}"

        @ Received math result
        event RESULT(
            result: F32 @< The math result
        ) \
        severity activity high \
        format "Math result is {f}"

        # -----------------------
        # Telemetry
        # -----------------------

        @ The first value
        telemetry VAL1: F32
    
        @ The operation
        telemetry OP: MathOp
        
        @ The second value
        telemetry VAL2: F32

        @ The result
        telemetry RESULT: F32

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Port for sending command registrations
        command reg port cmdRegOut

        @ Port for receiving commands
        command recv port cmdIn

        @ Port for sending command responses
        command resp port cmdResponseOut

        @ Port for sending textual representation of events
        text event port logTextOut

        @ Port for sending events to downlink
        event port logOut

        @ Port for sending telemetry channels to downlink
        telemetry port tlmOut

        @ Port to return the value of a parameter
        param get port prmGetOut

        @Port to set the value of a parameter
        param set port prmSetOut

    }
}