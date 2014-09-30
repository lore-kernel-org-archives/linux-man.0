From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: Document POSIX MQ /proc/sys/fs/mqueue files
Date: Tue, 30 Sep 2014 10:42:30 -0700
Message-ID: <1412098950.849.0.camel@linux-t7sj.site>
References: <542921EA.4050709@gmail.com>
	 <1412011687.15492.39.camel@firewall.xsintricity.com>
	 <CAKgNAkj9+Z1yO-zrQ_qWFut7BqOkzNtNCruSSRyTKMpXZOcBaw@mail.gmail.com>
	 <1412098223.23497.42.camel@linux-t7sj.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412098223.23497.42.camel@linux-t7sj.site>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: Doug Ledford <dledford@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Madars Vitolins <m@silodev.com>, Manfred Spraul <manfred@colorfullife.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-man@vger.kernel.org

On Tue, 2014-09-30 at 10:30 -0700, Davidlohr Bueso wrote:
> Agreed. And this needs to be changed back -- *although* there have been
> 0 bug reports afaict. Probably similarly to what we did with the
> queues_max issue: stable since v3.5. Doug, any thoughts?

Note that by changing back, I don't mean reverting your patches, just
not exporting the extra bits to QSIZE.
