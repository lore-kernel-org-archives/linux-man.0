From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Bug in select_tut
Date: Mon, 26 Jan 2009 15:08:09 +1300
Message-ID: <cfd18e0f0901251808y4ae1d3e7r641d77c883ddd9f2@mail.gmail.com>
References: <4971E510.9050301@riot.org> <497C46B0.7050509@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <497C46B0.7050509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Kienzl <seb-O0gdCS+Gcp8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jan 26, 2009 at 12:02 AM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hello Sebastian,
>
> Sebastian Kienzl wrote:
>> Hello!
>>
>> There's a bug in the select_tut man-page in the chapter "Combining
>> Signal and Data Events", which should illustrate pselect()-usage.
>>
>> See the attachments for detailed information, proof-code and a proposed
>> fix.
>>
>> Regards,
>> Seb.
>
> What do you think of the revised (but still incomplete)
> program below?

Hmmm -- obviously, s/SIGCHILD/SIGCHLD/ throughout the example code I
sent earlier.

Cheers,

Michael

> Michael
>
>       static volatile sig_atomic_t got_SIGCHILD = 0;
>
>       void
>       child_sig_handler(int sig)
>       {
>           got_SIGCHILD = 1;
>       }
>
>       int
>       main(int argc, char *argv[])
>       {
>           sigset_t sigmask, empty_mask;
>           struct sigaction sa;
>           fd_set readfs, writefds, exceptfds;
>           int r;
>
>           sigemptyset(&sigmask);
>           sigaddset(&sigmask, SIGCHLD);
>           if (sigprocmask(SIG_BLOCK, &sigmask, NULL) == -1) {
>               perror("sigprocmask");
>               exit(EXIT_FAILURE);
>           }
>
>           sa.sa_flags = 0;
>           sa.sa_handler = child_sig_handler;
>           sigemptyset(&sa.sa_mask);
>           if (sigaction(SIGCHILD, &sa, NULL) == -1) {
>               perror("sigaction");
>               exit(EXIT_FAILURE);
>           }
>
>           sigemptyset(empty_mask);
>
>           for (;;) {          /* main loop */
>               /* Initialize readfds, writefds, and exceptfds
>                  before the pselect() call. (Code omitted.) */
>
>               r = pselect(nfds, &readfs, &writefds, &exceptfd,
>                           0, &empty_mask);
>               if (r == -1 && errno != EINTR) {
>                   /* Handle error */
>               }
>
>               if (got_SIGCHILD) {
>                   got_SIGCHILD = 0;
>
>                   /* Handle signalled event here; e.g., wait() for all
>                      terminated children. (Code omitted.) */
>               }
>
>               /* main body of program */
>           }
>       }
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
