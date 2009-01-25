From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Bug in select_tut
Date: Sun, 25 Jan 2009 12:02:08 +0100
Message-ID: <497C46B0.7050509@gmail.com>
References: <4971E510.9050301@riot.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4971E510.9050301-O0gdCS+Gcp8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Kienzl <seb-O0gdCS+Gcp8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sebastian,

Sebastian Kienzl wrote:
> Hello!
> 
> There's a bug in the select_tut man-page in the chapter "Combining
> Signal and Data Events", which should illustrate pselect()-usage.
> 
> See the attachments for detailed information, proof-code and a proposed
> fix.
> 
> Regards,
> Seb.

What do you think of the revised (but still incomplete)
program below?

Cheers,

Michael

       static volatile sig_atomic_t got_SIGCHILD = 0;

       void
       child_sig_handler(int sig)
       {
           got_SIGCHILD = 1;
       }

       int
       main(int argc, char *argv[])
       {
           sigset_t sigmask, empty_mask;
           struct sigaction sa;
           fd_set readfs, writefds, exceptfds;
           int r;

           sigemptyset(&sigmask);
           sigaddset(&sigmask, SIGCHLD);
           if (sigprocmask(SIG_BLOCK, &sigmask, NULL) == -1) {
               perror("sigprocmask");
               exit(EXIT_FAILURE);
           }

           sa.sa_flags = 0;
           sa.sa_handler = child_sig_handler;
           sigemptyset(&sa.sa_mask);
           if (sigaction(SIGCHILD, &sa, NULL) == -1) {
               perror("sigaction");
               exit(EXIT_FAILURE);
           }

           sigemptyset(empty_mask);

           for (;;) {          /* main loop */
               /* Initialize readfds, writefds, and exceptfds
                  before the pselect() call. (Code omitted.) */

               r = pselect(nfds, &readfs, &writefds, &exceptfd,
                           0, &empty_mask);
               if (r == -1 && errno != EINTR) {
                   /* Handle error */
               }

               if (got_SIGCHILD) {
                   got_SIGCHILD = 0;

                   /* Handle signalled event here; e.g., wait() for all
                      terminated children. (Code omitted.) */
               }

               /* main body of program */
           }
       }
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
