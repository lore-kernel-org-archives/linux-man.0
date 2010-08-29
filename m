From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for epoll_ctl.2
Date: Sun, 29 Aug 2010 11:43:20 +0200
Message-ID: <AANLkTimYDbQ5F2kFDF+rn2JFS7g42VvmrYq7679N4XWJ@mail.gmail.com>
References: <20100814095315.0b88bf18@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100814095315.0b88bf18-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2010/8/14 Yuri Kozlov wrote:
> Hello.
> --- man-pages-git/man2/epoll_ctl.2 =C2=A0 =C2=A0 =C2=A02010-03-26 17:=
46:41.000000000 +0300
> +++ /tmp/epoll_ctl.2 =C2=A0 =C2=A02010-08-14 09:51:09.000000000 +0400
> @@ -81,12 +81,12 @@
> =C2=A0typedef union epoll_data {
> =C2=A0 =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0*ptr;
> =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd;
> - =C2=A0 =C2=A0__uint32_t =C2=A0 u32;
> - =C2=A0 =C2=A0__uint64_t =C2=A0 u64;
> + =C2=A0 =C2=A0uint32_t =C2=A0 u32;
> + =C2=A0 =C2=A0uint64_t =C2=A0 u64;
> =C2=A0} epoll_data_t;
>
> =C2=A0struct epoll_event {
> - =C2=A0 =C2=A0__uint32_t =C2=A0 events; =C2=A0 =C2=A0 =C2=A0/* Epoll=
 events */
> + =C2=A0 =C2=A0uint32_t =C2=A0 events; =C2=A0 =C2=A0 =C2=A0/* Epoll e=
vents */
> =C2=A0 =C2=A0 epoll_data_t data; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* User d=
ata variable */
> =C2=A0};
> =C2=A0.fi

Hello Michael,

This patch (found in e4123e51) breaks alignment of C comments, usually
you align them when describing data structures.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
