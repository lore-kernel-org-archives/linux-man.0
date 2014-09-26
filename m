From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: strncat
Date: Fri, 26 Sep 2014 12:21:35 +0100
Message-ID: <CAGc9EveqpQ7qMcdVn_1GY50YNKM4EXHxVwx82GwUv-8ajTkduQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

http://man7.org/linux/man-pages/man3/strcat.3.html

"Therefore, the size of dest must be at least strlen(dest)+n+1."

Is it worth clarifying that this means a user concatenating a string
needs to carefully avoid an overrun by doing strncat(dest, src, n -
strlen(dest));  ?

e.g:
size_t n = 20;
char dest[n];
char * src = "test";

strncat(dest, src, n - strlen(dest));

Bes regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
