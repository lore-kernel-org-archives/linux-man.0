From: Rich Felker <dalias@libc.org>
Subject: Re: futex_cmpxchg_enabled breakage
Date: Mon, 17 Sep 2018 12:51:05 -0400
Message-ID: <20180917165105.GO17995@brightrain.aerifal.cx>
References: <20180829222221.GA22017@brightrain.aerifal.cx>
 <87fty9hc2u.fsf@mid.deneb.enyo.de>
 <20180916131637.GA17995@brightrain.aerifal.cx>
 <877ejlh89n.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <877ejlh89n.fsf@mid.deneb.enyo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Weimer <fw@deneb.enyo.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, linux-man@vger.kernel.org, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
List-Id: linux-man@vger.kernel.org

On Sun, Sep 16, 2018 at 03:38:44PM +0200, Florian Weimer wrote:
> * Rich Felker:
> 
> >> I believe the expected userspace interface is that you probe support
> >> with set_robust_list first, and then start using the relevant futex
> >> interfaces only if that call succeeded.
> >
> > In order for it to work, set_robust_list needs to succeed for all
> > threads, present and future, so there's an implicit contract needed
> > here that, if it succeeds once, it needs to always succeed. This is
> > satisfied by the kernel implementation.
> 
> It certainly makes simpler if set_robust_list cannot fail due to
> resource allocation issues.
> 
> > Presumably a similar probing should happen in
> > pthread_mutexattr_setprotocol for PI mutex support. Does glibc do
> > this? musl still lacks PI mutex support so I'll save this as a note
> > for when it's added.
> 
> glibc currently implements checking for support in pthread_mutex_init,
> presumably due to the fact that some invalid attribute/flag
> combinations can only reasonably detected at that point.  It makes
> probing for support slightly more difficult, of course.
> 
> >> If you do that, most parts of
> >> a typical system will work as expected even if the kernel support is
> >> not there, which is a bit surprising.  It definitely makes the root
> >> cause harder to spot.
> >
> > I don't follow here. "most parts of a typical system will work as
> > expected" seems to be the case whether you do or don't correctly
> > probe. The only difference is whether a program that carefully checks
> > for errors will see and report that pthread_mutexattr_setrobust
> > failed.
> 
> This may be the case.  We only ever had the glibc test failures as
> evidence that something was quite wrong, despite ongoing validation of
> the system.  But this could have been accident due to an invalid test
> environment.  (The product in question is only supposed to support the
> radix MMU, but when running under KVM, the kernel switches to the hash
> MMU instead, which masks the presence of the bug—set_robust_list is
> magically available again.)

BTW here's a horrible thought: can the availability of set_robust_list
change across checkpoint/restore? If so that's fundamental breakage in
the checkpoint/restore functionality, and a good reason to make it so
this functionality is not runtime-variable for a given kernel.

Rich
