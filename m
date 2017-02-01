From: Yuchung Cheng <ycheng-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] tcp.7: Add description for TCP_FASTOPEN and
Date: Wed, 1 Feb 2017 10:50:36 -0800
Message-ID: <CAK6E8=e-YZza-REJO--OkpX74OfnYLjSdzHRdjGms6hr7q7j=w@mail.gmail.com>
References: <20170201013839.93106-1-tracywwnj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201013839.93106-1-tracywwnj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Jan 31, 2017 at 5:38 PM, Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> From: Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>
> TCP_FASTOPEN socket option was added by:
> commit 8336886f786fdacbc19b719c1f7ea91eb70706d4
> TCP_FASTOPEN_CONNECT socket option was added by the following patch
> series:
> commit 065263f40f0972d5f1cd294bb0242bd5aa5f06b2
> commit 25776aa943401662617437841b3d3ea4693ee98a
> commit 19f6d3f3c8422d65b5e3d2162e30ef07c6e21ea2
> commit 3979ad7e82dfe3fb94a51c3915e64ec64afa45c3
> Add detailed description for these 2 options
>
> Signed-off-by: Wei Wang <weiwan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
Acked-by: Yuchung Cheng <ycheng-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Thanks Wei! this is overdue :-)

>  man7/tcp.7 | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>
> diff --git a/man7/tcp.7 b/man7/tcp.7
> index 529246145..c03aa60db 100644
> --- a/man7/tcp.7
> +++ b/man7/tcp.7
> @@ -1149,6 +1149,96 @@ Bound the size of the advertised window to this value.
>  The kernel imposes a minimum size of SOCK_MIN_RCVBUF/2.
>  This option should not be used in code intended to be
>  portable.
> +.TP
> +.BR TCP_FASTOPEN " (since Linux 3.6)"
> +This option enables Fast Open on the listener socket. The option value
> +specifies the PendingFastOpenRequests threshold, i.e. the maximum length
> +of pending SYNs with data payload. Once enabled, the TCP implementation
> +will respond with TCP Fast Open cookies per request.
> +.TP
> +.BR TCP_FASTOPEN_CONNECT " (since Linux 4.11)"
> +This option enables an alternative way to perform Fast Open on the active
> +side (client).
> +When this option is enabled,
> +.BR connect (2)
> +would behave differently depending if a Fast Open cookie is available for
> +the destination.
> +
> +If a cookie is not available (i.e. first contact to the destination),
> +.BR connect (2)
> +behaves as usual by sending a SYN immediately, except the SYN would include
> +an empty Fast Open cookie option to solicit a cookie.
> +
> +If a cookie is available,
> +.BR connect (2)
> +would return 0 immediately but the SYN transmission is defered. A subsequent
> +.BR write (2)
> +or
> +.BR sendmsg (2)
> +would trigger a SYN with data plus cookie in the Fast Open option. In other
> +words, the actual connect operation is deferred until data is supplied.
> +
> +While this option is designed for convenience, enabling it does change the
> +behaviors and might return new errnos of socket calls:
> +  s = socket()
> +    Create a new socket
> +  setsockopt(s, IPPROTO_TCP, TCP_FASTOPEN_CONNECT, ...)
> +    Set this option
> +  connect()
> +    With cookie present, return 0 immediately.
> +    With no cookie, initiate 3WHS with Fast Open option empty and return
> +.B EINPROGRESS
> +  write()/sendmsg()
> +    With cookie present and
> +.BR connect (2)
> +called ahead, send out SYN with data plus cookie in the Fast Open option
> +and return the number of bytes buffered.
> +    With no cookie and 3 WHS not yet completed, return
> +.B EINPROGRESS.
> +    No
> +.B MSG_FASTOPEN
> +flag is needed.
> +
> +  read()
> +    Return
> +.B EWOULDBLOCK
> +/
> +.B EAGAIN
> +if 3WHS is not yet completed.
> +    Return
> +.B EWOULDBLOCK
> +/
> +.B EAGAIN
> +if connection is established but no message has been received.
> +    Return number of bytes read if connection is established and message
> +    has been received.
> +
> +.B Note:
> +  With cookie present,
> +.BR write (2)
> +/
> +.BR sendmsg (2)
> +must be called right after
> +.BR connect (2)
> +in order to send out SYN+data to complete 3WHS and establish connection.
> +  Calling
> +.BR read (2)
> +right after
> +.BR connect (2)
> +without
> +.BR write (2)
> +will cause the blocking socket to be blocked forever.
> +
> +Here is the typical call flow with this new option:
> +  s = socket();
> +  setsockopt(s, IPPROTO_TCP, TCP_FASTOPEN_CONNECT, 1, ...);
> +  connect(s);
> +  write(s); // write() should always follow connect() in order to
> +            // trigger SYN to go out
> +  read(s)/write(s);
> +  ...
> +  close(s);
> +
>  .SS Sockets API
>  TCP provides limited support for out-of-band data,
>  in the form of (a single byte of) urgent data.
> --
> 2.11.0.483.g087da7b7c-goog
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
