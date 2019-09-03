Return-Path: <SRS0=y5wq=W6=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3285C3A5A5
	for <linux-man@archiver.kernel.org>; Tue,  3 Sep 2019 04:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBDA321881
	for <linux-man@archiver.kernel.org>; Tue,  3 Sep 2019 04:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbfICEFp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 3 Sep 2019 00:05:45 -0400
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:47712 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfICEFp (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 3 Sep 2019 00:05:45 -0400
X-Greylist: delayed 844 seconds by postgrey-1.27 at vger.kernel.org; Tue, 03 Sep 2019 00:05:45 EDT
Received: from dalias by brightrain.aerifal.cx with local (Exim 3.15 #2)
        id 1i4zqu-0003qd-00; Tue, 03 Sep 2019 03:51:32 +0000
Date:   Mon, 2 Sep 2019 23:51:32 -0400
From:   Rich Felker <dalias@libc.org>
To:     Florian Weimer <fweimer@redhat.com>
Cc:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        Eric Blake <eblake@redhat.com>,
        glibc list <libc-alpha@sourceware.org>,
        linux-man@vger.kernel.org
Subject: Re: f_owner_ex vs. POSIX
Message-ID: <20190903035132.GV9017@brightrain.aerifal.cx>
References: <a6d65cee-a909-449c-484d-66cd26093958@redhat.com>
 <bdc9527b-6595-9f4e-b35d-3796967e044c@gmail.com>
 <87mufmvmlm.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mufmvmlm.fsf@oldenburg2.str.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Mon, Sep 02, 2019 at 03:44:53PM +0200, Florian Weimer wrote:
> * Michael Kerrisk:
> 
> > I do not know what the rationale was for the addition of the 'enum',
> > and it wouldn't surprise me if there was no public discussion about
> > it. The use of an 'enum' strikes me as a slightly odd decision (given
> > that the kernel uses 'int') but, related to your point below, there
> > is precedent in, for example, the use of an 'enum' for 'idtype_t' in
> > waitid() inside glibc, while the kernel type for the argument in
> > the underlying system call is 'int'.
> 
> There is also the issue of -fshort-enum.  Some people probably expect
> that they can use that option and still use glibc headers.
> 
> I do not have any inside knowledge why things are like they are.
> Presumably we can switch the type member to int.

I'm strongly in favor of switch to int. enum types are an
ABI/compatibility nightmare and have little purpose (unlike enum
constants which are actually useful).

Rich
