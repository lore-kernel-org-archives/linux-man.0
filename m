From: Andi Kleen <andi@firstfloor.org>
Subject: Re: TCP_CONGESTION documentation
Date: Sun, 23 Nov 2008 21:06:58 +0100
Message-ID: <20081123200658.GT6703@one.firstfloor.org>
References: <4926DC7B.7020203@gmail.com> <cfd18e0f0811210808u349aad61y2ae8a1590904a821@mail.gmail.com> <20081121204210.GG6703@one.firstfloor.org> <cfd18e0f0811211244v5d391f8du3380332a721ed33@mail.gmail.com> <20081121233918.7ade5fcb@extreme> <20081122145632.GQ6703@one.firstfloor.org> <20081122223414.48fd94dc@extreme>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081122223414.48fd94dc@extreme>
Sender: linux-net-owner@vger.kernel.org
To: Stephen Hemminger <shemminger@linux-foundation.org>
Cc: Andi Kleen <andi@firstfloor.org>, mtk.manpages@gmail.com, mtk.manpages@googlemail.com, David Miller <davem@davemloft.net>, linux-net@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

> There is no "standard default" it is a kernel config option.

There is one default y and very strong suggestions
in Kconfig.  I bet 99+% of the users use that, which means CUBIC now
since kernel version number XX.YY (I forgot)

Also the "depends on kernel config option" argument seems a poor
one. A lot of things can be disabled with uncommon CONFIG options,
but the man pages still document the standard defaults used
by near all people.

> And it may change in future, so writing it into the manual page
> seems being short sighted.

That just means that users will never know.

-Andi

-- 
ak@linux.intel.com
