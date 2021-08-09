#include "libtester.h"
#include <QtDebug>
#include <skqtauth.h>
LibTester::LibTester(QObject *parent)
{

}

void LibTester::callFromCpp()
{
  qDebug()<<"caaling c"<<__FUNCTION__<<" on line "<<__LINE__;

  //
 SKQtAuth *auth=new SKQtAuth;

  // will it work?i think yes, lets try
  // wait i wannt to initialise something, perhaps, crash
  auth->setApiKey("AIzaSyBfIiKhSNiJ4XSvD05VhCNxT-xhN2_Tnyw");

  // strange errors uuh!yes very strang for me, and too ulgy
  // here is the
auth->signInUser("test@gmail.com","123456");
}
