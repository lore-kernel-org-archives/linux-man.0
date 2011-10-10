From: Pat Pannuto <pat.pannuto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages: pthread_sigmask comment / code inconsistency
Date: Mon, 10 Oct 2011 03:53:40 -0400
Message-ID: <CA+Yp1NV_=VxcRvxUJYhKoGfafwqPpfS3m-hfHcQ0SzUeM1zpjQ@mail.gmail.com>
Reply-To: pat.pannuto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is found on both my installed 3.27 and the html 3.32 release
http://kernel.org/doc/man-pages/online/pages/man3/pthread_sigmask.3.html

In the sample code, the comment indicates blocking SIGINT, while the code
appears to be blocking SIGQUIT and SIGURS1.  This is confusing.  I believe
removing the words "Block SIGINT; " would clarify the example.

Sorry for not sending a patch, the git repo seems to still be down.
(from here: git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git)

Please CC on any replies, I am not on these mailing lists.

-pat

relevant bits:

 /* Block SIGINT; other threads created by main() will inherit
              a copy of the signal mask. */

           sigemptyset(&set);
           sigaddset(&set, SIGQUIT);
           sigaddset(&set, SIGUSR1);
           s = pthread_sigmask(SIG_BLOCK, &set, NULL);

--
Pat Pannuto
Computer Engineering
University of Michigan
248.990.4548
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
