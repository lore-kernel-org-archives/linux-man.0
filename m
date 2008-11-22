From: Andi Kleen <andi@firstfloor.org>
Subject: Re: TCP_CONGESTION documentation
Date: Sat, 22 Nov 2008 15:56:32 +0100
Message-ID: <20081122145632.GQ6703@one.firstfloor.org>
References: <4926DC7B.7020203@gmail.com> <cfd18e0f0811210808u349aad61y2ae8a1590904a821@mail.gmail.com> <20081121204210.GG6703@one.firstfloor.org> <cfd18e0f0811211244v5d391f8du3380332a721ed33@mail.gmail.com> <20081121233918.7ade5fcb@extreme>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081121233918.7ade5fcb@extreme>
Sender: linux-net-owner@vger.kernel.org
To: Stephen Hemminger <shemminger@linux-foundation.org>
Cc: mtk.manpages@gmail.com, mtk.manpages@googlemail.com, Andi Kleen <andi@firstfloor.org>, David Miller <davem@davemloft.net>, linux-net@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri, Nov 21, 2008 at 11:39:18PM -0800, Stephen Hemminger wrote:
> Does this help get it started in right direction??

Yes.

> --------------------------------------------
> 
>        This  is an implementation of the TCP protocol defined in
>        RFC 793, RFC 1122 and RFC 2001 with the NewReno and  SACK
>        extensions.   It  provides  a  reliable, stream-oriented,

Perhaps drop NewReno, it's really obsolete because Linux is so 
far beyond.

> 
>        Note that  TCP  actually  allocates twice the size of the
>        buffer requested in

The "twice" is obsolete, it's far more complicated now.
So it should be just "more" I think

>        socket  option  is  enabled,  urgent data is put into the
>        normal data stream (a program can test for  its  location
>        using the SIOCATMARK ioctl described below), otherwise it
>        can be only received when the MSG_OOB  flag  is  set  for
>        recv(2) or recvmsg(2).
> 
> Linux supports multiple different congestion control
> algorithms. The default choice of congestion control is controlled
> by net.ipv4.tcp_congestion_control sysctl. This value can
> be overridden by TCP_CONGESTION socket option. The actual choices
> of congestion control available vary according between release
> as more are added, and depend on the configuration choices

Hmm perhaps mention the current standard default?

> made when the kernel was built. The list of congestion control
> protocols currently loaded is in net.ipv4.tcp_available_congestion_control.

Best would be probably to have an manpage for each of them, but I'm
not going to write them :)

-Andi

-- 
ak@linux.intel.com
