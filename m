From: "Zhen Ren" <zren-IBi9RG/b67k@public.gmane.org>
Subject: "man 3 vsprintf" : simple bug in EXAMPLE section
Date: Thu, 26 Mar 2015 23:27:10 -0600
Message-ID: <551584DE020000D400069A4C@relay2.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,
There is simple bug in EXAMPLE section of "man 3 vsprintf".

Function will return nothing if  it steps into the last "else {}".

------------------ example code -----------------
 char *
       make_message(const char *fmt, ...)
       {
           int n;
           int size = 100;     /* Guess we need no more than 100 bytes */
           char *p, *np;
           va_list ap;
.
cut off
.
               np = realloc(p, size);
               if (np == NULL) {
                   free(p);
                   return NULL;
               } else {
                   p = np;
+                return p;
               }
           }
       }
------------------------------------------------


--
Best regards,
Eric, Ren
HA team, SUSE


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
