From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ioctl_tty.2: add TIOCGPTPEER documentation
Date: Tue, 15 Aug 2017 21:27:33 +0200
Message-ID: <11706e49-8271-ed8c-3747-19b3e8f2850d@gmail.com>
References: <20170609170147.32311-1-asarai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170609170147.32311-1-asarai-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksa Sarai <asarai-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Valentin Rothberg <vrothberg-IBi9RG/b67k@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/09/2017 07:01 PM, Aleksa Sarai wrote:
> The feature this patch references has currently only been accepted into
> tty-testing, but Greg told me to kick this down to man-pages. As a
> result, I can't reference upstream commit id's because the code isn't in
> Linus' tree yet -- should I resend this once it lands in tty-next or
> Linus' tree?
> 
> Also obviously the release version is a bit of a lie.

Hello Aleksa,

I've applied this patch, and then tweaked the wording a little. Could
you please check the following text:

       TIOCGPTPEER    int flags
              (since Linux 4.13) Given  a  file  descriptor  in  fd  that
              refers  to  a  pseudoterminal  master, open (with the given
              open(2)-style flags) and return a new file descriptor  that
              refers to the peer pseudoterminal slave device.  This oper‐
              ation can be performed regardless of whether  the  pathname
              of  the  slave  device  is  accessible  through the calling
              process's mount namespaces.

              Security-conscious programs interacting with namespaces may
              wish  to  use  this  operation rather than open(2) with the
              pathname returned by ptsname(3), and similar library  func‐
              tions that have insecure APIs.

I also have a question on the last sentence: what are the "similar library
functions that have insecure APIs"? It's not clear to me what you are 
referring to here.

Cheers,

Michael

> 
> 8<-----------------------------------------------------------------------
> 
> This is an ioctl(2) recently added by myself, to allow for container
> runtimes and other programs that interact with (potentially hostile)
> Linux namespaces to safely create {master,slave} pseudoterminal pairs
> without needing to open potentially unsafe /dev/pts/... filenames that
> may be malicious mountpoints or similar in an untrusted namespace
> (avoiding the endless issues with ptsname(3) and similar approaches).
> 
> Cc: <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
> Signed-off-by: Aleksa Sarai <asarai-l3A5Bk7waGM@public.gmane.org>
> ---
>  man2/ioctl_tty.2 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man2/ioctl_tty.2 b/man2/ioctl_tty.2
> index d280beacf..61e147d99 100644
> --- a/man2/ioctl_tty.2
> +++ b/man2/ioctl_tty.2
> @@ -380,6 +380,21 @@ Place the current lock state of the pseudoterminal slave device
>  in the location pointed to by
>  .IR argp
>  (since Linux 3.8).
> +.TP
> +.BI "TIOCGPTPEER	int " flags
> +Opens and returns a new file handle to the pseudoterminal slave
> +device with the given
> +.BR open (2)-style
> +.IR flags ,
> +regardless of whether the path is accessible through the calling process's
> +mount namespaces.
> +
> +Security-conscious programs interacting with namespaces may wish to use this
> +over
> +.BR open (2)
> +with the path provided by
> +.BR ptsname (3),
> +and similar library methods that have insecure APIs (since Linux 4.13).
>  .PP
>  The BSD ioctls
>  .BR TIOCSTOP ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
