From: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: poll never return EBADF?
Date: Tue, 26 May 2009 18:09:32 +0900 (JST)
Message-ID: <20090526175622.687B.A69D9226@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

I have one stupid question.

"man poll" describe this error code.

>ERRORS
>       EBADF  An invalid file descriptor was given in one of the sets.

but current kernel implementation ignore invalid file descriptor,
not return EBADF.


================ cut code ========================================
static inline unsigned int do_pollfd(struct pollfd *pollfd, poll_table *pwait)
{
        unsigned int mask;
        int fd;

        mask = 0;
        fd = pollfd->fd;
        if (fd >= 0) {					//// here
                int fput_needed;
                struct file * file;

                file = fget_light(fd, &fput_needed);
                mask = POLLNVAL;
                if (file != NULL) {			//// and here
                        mask = DEFAULT_POLLMASK;
                        if (file->f_op && file->f_op->poll)
                                mask = file->f_op->poll(file, pwait);
                        /* Mask out unneeded events. */
                        mask &= pollfd->events | POLLERR | POLLHUP;
                        fput_light(file, fput_needed);
                }
        }
================ end code ========================================

In the other hand, SUSv3 talk about 

> POLLNVAL
>    The specified fd value is invalid. This flag is only valid in the
>    revents member; it shall ignored in the events member.

and

> If the value of fd is less than 0, events shall be ignored, and revents 
> shall be set to 0 in that entry on return from poll().

but, no desribe EBADF.
(see http://www.opengroup.org/onlinepubs/009695399/functions/poll.html)

So, I think the implementation is correct.


Why don't we remove EBADF description?



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
