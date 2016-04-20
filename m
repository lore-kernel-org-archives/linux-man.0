From: Zack Weinberg <zackw@panix.com>
Subject: Re: [PATCH] makedev(3): point people at sys/sysmacros.h
Date: Wed, 20 Apr 2016 07:47:54 -0400
Message-ID: <CAKCAbMiMNtMmCP4EPZnZ5DpSNaNc=SDbbdKKZmoRybmWHyOoTg@mail.gmail.com>
References: <20160418164908.GR5369@vapier.lan>
	<1461045163-21248-1-git-send-email-vapier@gentoo.org>
	<5717687D.2060300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <libc-alpha-return-68999-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <5717687D.2060300@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org, GNU C Library <libc-alpha@sourceware.org>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 20, 2016 at 7:31 AM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> On 04/19/2016 06:52 AM, Mike Frysinger wrote:
>> Defining these functions via sys/types.h violates POSIX namespace
>> requirements,
>
> What do the previous lines mean? Violate namespace requirements how?

I think it's technically not true that they violate POSIX namespace
requirements, since they're only defined in the non-conforming modes.

The reason I originally proposed the change is that libstdc++
force-enables _GNU_SOURCE, which means people writing in C++ _can't_
avoid these nonstandard macros by using a strict conformance mode.

zw
