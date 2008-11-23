From: Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: TCP_CONGESTION documentation
Date: Sat, 22 Nov 2008 22:34:14 -0800
Message-ID: <20081122223414.48fd94dc@extreme>
References: <4926DC7B.7020203@gmail.com>
	<cfd18e0f0811210808u349aad61y2ae8a1590904a821@mail.gmail.com>
	<20081121204210.GG6703@one.firstfloor.org>
	<cfd18e0f0811211244v5d391f8du3380332a721ed33@mail.gmail.com>
	<20081121233918.7ade5fcb@extreme>
	<20081122145632.GQ6703@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081122145632.GQ6703-qrUzlfsMFqo/4alezvVtWx2eb7JE58TQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-net-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, 22 Nov 2008 15:56:32 +0100
Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:

> On Fri, Nov 21, 2008 at 11:39:18PM -0800, Stephen Hemminger wrote:
> > Does this help get it started in right direction??
> 
> Yes.
> 
> > --------------------------------------------
> > 
> >        This  is an implementation of the TCP protocol defined in
> >        RFC 793, RFC 1122 and RFC 2001 with the NewReno and  SACK
> >        extensions.   It  provides  a  reliable, stream-oriented,
> 
> Perhaps drop NewReno, it's really obsolete because Linux is so 
> far beyond.
> 
> > 
> >        Note that  TCP  actually  allocates twice the size of the
> >        buffer requested in
> 
> The "twice" is obsolete, it's far more complicated now.
> So it should be just "more" I think
> 
> >        socket  option  is  enabled,  urgent data is put into the
> >        normal data stream (a program can test for  its  location
> >        using the SIOCATMARK ioctl described below), otherwise it
> >        can be only received when the MSG_OOB  flag  is  set  for
> >        recv(2) or recvmsg(2).
> > 
> > Linux supports multiple different congestion control
> > algorithms. The default choice of congestion control is controlled
> > by net.ipv4.tcp_congestion_control sysctl. This value can
> > be overridden by TCP_CONGESTION socket option. The actual choices
> > of congestion control available vary according between release
> > as more are added, and depend on the configuration choices
> 
> Hmm perhaps mention the current standard default?

There is no "standard default" it is a kernel config option.
And it may change in future, so writing it into the manual page
seems being short sighted.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
