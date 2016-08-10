From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] select_tut.2: fix issues in example
Date: Thu, 11 Aug 2016 06:47:00 +1200
Message-ID: <56674532-cdbe-6956-04a4-6201d0e3a0fe@gmail.com>
References: <20160810152316.17600-1-peter@lekensteyn.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160810152316.17600-1-peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peter,

On 08/11/2016 03:23 AM, Peter Wu wrote:
> Avoid closing cfd if it is -1. Initialize buf1_avail, etc. to avoid
> uninitialized memory access in the event that accept() fails. Remove
> redundant setting of nfds. Fix tabs with spaces.
>
> Do not try to read/write from/to file descriptors once an existing
> connection is overwritten, the select() states are stale now.
> Avoid writing zero bytes from the buffer and then closing the fd.

Thanks for these clean-ups! Patch applied.

Cheers,

Michael

  
> Signed-off-by: Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org>
> ---
>  man2/select_tut.2 | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/man2/select_tut.2 b/man2/select_tut.2
> index 25dd3c6..7e4f41d 100644
> --- a/man2/select_tut.2
> +++ b/man2/select_tut.2
> @@ -594,7 +594,6 @@ connect_socket(int connect_port, char *address)
>      cfd = socket(AF_INET, SOCK_STREAM, 0);
>      if (cfd == \-1) {
>          perror("socket");
> -        close(cfd);
>          return \-1;
>      }
>
> @@ -641,8 +640,8 @@ main(int argc, char *argv[])
>      int h;
>      int fd1 = \-1, fd2 = \-1;
>      char buf1[BUF_SIZE], buf2[BUF_SIZE];
> -    int buf1_avail, buf1_written;
> -    int buf2_avail, buf2_written;
> +    int buf1_avail = 0, buf1_written = 0;
> +    int buf2_avail = 0, buf2_written = 0;
>
>      if (argc != 4) {
>          fprintf(stderr, "Usage\\n\\tfwd <listen\-port> "
> @@ -660,7 +659,7 @@ main(int argc, char *argv[])
>
>      for (;;) {
>          int ready, nfds = 0;
> -	ssize_t nbytes;
> +        ssize_t nbytes;
>          fd_set readfds, writefds, exceptfds;
>
>          FD_ZERO(&readfds);
> @@ -668,22 +667,18 @@ main(int argc, char *argv[])
>          FD_ZERO(&exceptfds);
>          FD_SET(h, &readfds);
>          nfds = max(nfds, h);
> -        if (fd1 > 0 && buf1_avail < BUF_SIZE) {
> +
> +        if (fd1 > 0 && buf1_avail < BUF_SIZE)
>              FD_SET(fd1, &readfds);
> -            nfds = max(nfds, fd1);
> -        }
> -        if (fd2 > 0 && buf2_avail < BUF_SIZE) {
> +            /* Note: nfds is updated below, when fd1 is added to exceptfds. */
> +        if (fd2 > 0 && buf2_avail < BUF_SIZE)
>              FD_SET(fd2, &readfds);
> -            nfds = max(nfds, fd2);
> -        }
> -        if (fd1 > 0 && buf2_avail \- buf2_written > 0) {
> +
> +        if (fd1 > 0 && buf2_avail \- buf2_written > 0)
>              FD_SET(fd1, &writefds);
> -            nfds = max(nfds, fd1);
> -        }
> -        if (fd2 > 0 && buf1_avail \- buf1_written > 0) {
> +        if (fd2 > 0 && buf1_avail \- buf1_written > 0)
>              FD_SET(fd2, &writefds);
> -            nfds = max(nfds, fd2);
> -        }
> +
>          if (fd1 > 0) {
>              FD_SET(fd1, &exceptfds);
>              nfds = max(nfds, fd1);
> @@ -706,9 +701,9 @@ main(int argc, char *argv[])
>          if (FD_ISSET(h, &readfds)) {
>              socklen_t addrlen;
>              struct sockaddr_in client_addr;
> -	    int fd;
> +            int fd;
>
> -	    addrlen = sizeof(client_addr);
> +            addrlen = sizeof(client_addr);
>              memset(&client_addr, 0, addrlen);
>              fd = accept(h, (struct sockaddr *) &client_addr, &addrlen);
>              if (fd == \-1) {
> @@ -725,6 +720,9 @@ main(int argc, char *argv[])
>                  else
>                      printf("connect from %s\\n",
>                              inet_ntoa(client_addr.sin_addr));
> +
> +                /* Skip any events on the old, closed file descriptors. */
> +                continue;
>              }
>          }
>
> @@ -764,7 +762,7 @@ main(int argc, char *argv[])
>              else
>                  buf2_avail += nbytes;
>          }
> -        if (fd1 > 0 && FD_ISSET(fd1, &writefds)) {
> +        if (fd1 > 0 && FD_ISSET(fd1, &writefds) && buf2_avail > 0) {
>              nbytes = write(fd1, buf2 + buf2_written,
>                         buf2_avail \- buf2_written);
>              if (nbytes < 1)
> @@ -772,7 +770,7 @@ main(int argc, char *argv[])
>              else
>                  buf2_written += nbytes;
>          }
> -        if (fd2 > 0 && FD_ISSET(fd2, &writefds)) {
> +        if (fd2 > 0 && FD_ISSET(fd2, &writefds) && buf1_avail > 0) {
>              nbytes = write(fd2, buf1 + buf1_written,
>                         buf1_avail \- buf1_written);
>              if (nbytes < 1)
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
