// ======================================================================
// \title  HelloWorld.cpp
// \author matthew
// \brief  cpp file for HelloWorld component implementation class
// ======================================================================


#include <Components/HelloWorld/HelloWorld.hpp>
#include <FpConfig.hpp>

namespace Components {

  // ----------------------------------------------------------------------
  // Construction, initialization, and destruction
  // ----------------------------------------------------------------------

  HelloWorld ::
    HelloWorld(
        const char *const compName
    ) : HelloWorldComponentBase(compName), m_greetingCount(0)
  {

  }

  HelloWorld ::
    ~HelloWorld()
  {

  }

  // ----------------------------------------------------------------------
  // Command handler implementations
  // ----------------------------------------------------------------------

  void HelloWorld ::
    SAY_HELLO_cmdHandler(
        const FwOpcodeType opCode,
        const U32 cmdSeq,
        const Fw::CmdStringArg& greeting
    )
  {
    Fw::LogStringArg eventGreeting(greeting.toChar());
    this->log_ACTIVITY_HI_Hello(eventGreeting);
    this->tlmWrite_GreetingCount(++this->m_greetingCount);

    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
    
  }

} // end namespace Components
