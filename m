From: Florian Lehmann <flo.lehmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man crypt: #define __USE_XOPEN on 64-bit systems
Date: Sat, 30 Oct 2010 16:08:50 +0200
Message-ID: <1288447730.1866.10.camel@hobbes>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-62fdt5zRx9bcPOy4djT+"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-62fdt5zRx9bcPOy4djT+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Dear all,

I am using
Linux hobbes 2.6.35-22-generic #35-Ubuntu SMP Sat Oct 16 20:45:36 UTC
2010 x86_64 GNU/Linux

with manpages 
Version: 3.24-1ubuntu1

I was trying to run a simple c-program using the function crypt from
unistd.h

Tha manpages states to define the macro _XOPEN_SOURCE in order to use
this function. This works fine on a 32-bit Version of Ubuntu 10.10. On
the mentioned 54-bit system the program could not be compiled. 

On those systems you also have to define the macro __USE_XOPEN.
I attached the program. Just compile with
gcc -Wall crypter.c -lcrypt #will not work without __USE_XOPEN

Thanks a lot and best regards from Ulm,
Florian Lehmann


--=-62fdt5zRx9bcPOy4djT+
Content-Disposition: attachment; filename="crypter.c"
Content-Type: text/x-csrc; name="crypter.c"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

#include <stdio.h>
#define _XOPEN_SOURCE
#define __USE_XOPEN//needed on 64-bit
#include <unistd.h>
#include <string.h>
int main(){
  char pwd[9]="asd2/ASD";
  char sa[20];
  strcpy(sa,(char*)crypt(pwd,"xx") );
 
  printf("xx-crypted pw: %s\n",sa);

  return 0;

}

--=-62fdt5zRx9bcPOy4djT+--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
