From: Andi Kleen <andi@firstfloor.org>
Subject: Re: TCP_CONGESTION documentation
Date: Fri, 21 Nov 2008 21:42:10 +0100
Message-ID: <20081121204210.GG6703@one.firstfloor.org>
References: <4926DC7B.7020203@gmail.com> <cfd18e0f0811210808u349aad61y2ae8a1590904a821@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0811210808u349aad61y2ae8a1590904a821@mail.gmail.com>
Sender: linux-net-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: Stephen Hemminger <shemminger@linux-foundation.org>, David Miller <davem@davemloft.net>, linux-net@vger.kernel.org, linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@googlemail.com>, Andi Kleen <andi@firstfloor.org>
List-Id: linux-man@vger.kernel.org

On Fri, Nov 21, 2008 at 11:08:22AM -0500, Michael Kerrisk wrote:
> [CC+= Andi, this time with the right address]

Just a general comment. The initial DESCRIPTION in tcp should 
be probably adapted to mentioned that Linux has pluggable 
congestion avoidance modules now and also that the defaults
have changed (from NewReno to CUBIC etc.)

-Andi
