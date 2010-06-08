From: Andrew Klossner <andrew-pwabbKueSRu4mpay0g/RMEEOCMrvLtNR@public.gmane.org>
Subject: select_tut(2): error in example code
Date: Tue, 08 Jun 2010 08:41:25 -0700
Message-ID: <201006081541.o58FfQTt015276@pogo.cesa.opbu.xerox.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The select_tut(2) EXAMPLE has a one-character bug:

               /* NB: read oob data before normal reads */

               if (fd1 > 0)
                   if (FD_ISSET(fd1, &er)) {
                       char c;

                       r = recv(fd1, &c, 1, MSG_OOB);
                       if (r < 1)
                           SHUT_FD1;
                       else
                           send(fd2, &c, 1, MSG_OOB);
                   }
               if (fd2 > 0)
                   if (FD_ISSET(fd2, &er)) {
                       char c;

                       r = recv(fd2, &c, 1, MSG_OOB);
                       if (r < 1)
+->                        SHUT_FD1;
|                      else
|                          send(fd1, &c, 1, MSG_OOB);
|                  }
|
+-- should be SHUT_FD2;
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
