From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail-7wQd5C9ZzNw@public.gmane.org>
Subject: Re: net.ipv4.tcp_rmem does override net.core.rmem_max?
Date: Tue, 16 Feb 2016 19:20:17 +0100
Message-ID: <56C36861.7030904@nh2.me>
References: <56C35692.7010807@nh2.me> <56C356E5.8010004@nh2.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C356E5.8010004-7wQd5C9ZzNw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Or, there is the following interpretation:

  "This  value  does  not  override   the   global
  net.core.rmem_max."

might mean

  "This value does not override the global
  net.core.rmem_max to the extent that it does
  not define the upper users can set with SO_RCVBUF.
  It does, however, override net.core.rmem_max if
  SO_RCVBUF is not used."

This would be consistent with my findings.

I'm not 100% confident about whether this is what the code does though,
see my comment
http://stackoverflow.com/questions/31546835/tcp-receiving-window-size-h=
igher-than-net-core-rmem-max/35438236#comment58576526_35438236
for details on that.

On 16/02/16 18:05, Niklas Hamb=C3=BCchen wrote:
> An answer to the question I just posted,
>=20
>   http://stackoverflow.com/a/35438236/263061
>=20
> suggests that neither is the case, but in fact the kernel takes the
> maximum of the two values.
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
