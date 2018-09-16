From: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: futex_cmpxchg_enabled breakage
Date: Sun, 16 Sep 2018 14:16:25 +0200
Message-ID: <87fty9hc2u.fsf@mid.deneb.enyo.de>
References: <20180829222221.GA22017@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829222221.GA22017@brightrain.aerifal.cx> (Rich Felker's
        message of "Wed, 29 Aug 2018 18:22:21 -0400")
Sender: linux-kernel-owner@vger.kernel.org
To: Rich Felker <dalias@libc.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, linux-man@vger.kernel.org, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
List-Id: linux-man@vger.kernel.org

* Rich Felker:

> I just spent a number of hours helping someone track down a bug that
> looks like it's some kind of futex_cmpxchg_enabled detection error on
> powerpc64 (still not sure of the root cause; set_robust_list producing
> -ENOSYS), and a while back I hit the same problem on sh2 due to lack
> of EFAULT on nommu, leading to commit 72cc564f16ca. I think the test
> (introduced way back in commit a0c1e9073ef7) is fundamentally buggy;
> if anything, it should be checking for !=-ENOSYS, not ==-EFAULT.
> Presumably it could also fail to produce -EFAULT if mmap_min_addr is 0
> and page 0 is mapped (a bad idea, but maybe someone does it...). And
> of course other nommu archs are possibly still broken.

Maybe it was related to this (“Kernel 4.15 lost set_robust_list
support on POWER 9”):

<https://lists.ozlabs.org/pipermail/linuxppc-dev/2018-February/168570.html>

The Kconfig change you suggest was explicitly rejected as the fix.

I believe the expected userspace interface is that you probe support
with set_robust_list first, and then start using the relevant futex
interfaces only if that call succeeded.  If you do that, most parts of
a typical system will work as expected even if the kernel support is
not there, which is a bit surprising.  It definitely makes the root
cause harder to spot.
