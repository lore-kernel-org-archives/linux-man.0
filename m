Return-Path: <SRS0=HENb=EI=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2311C388F2
	for <linux-man@archiver.kernel.org>; Mon,  2 Nov 2020 12:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B3B022450
	for <linux-man@archiver.kernel.org>; Mon,  2 Nov 2020 12:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="h96f4hXA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgKBMal (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 2 Nov 2020 07:30:41 -0500
Received: from mail.efficios.com ([167.114.26.124]:54990 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbgKBMak (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 2 Nov 2020 07:30:40 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 78A672A8EE8;
        Mon,  2 Nov 2020 07:30:39 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id VEAcYRSz4_Nl; Mon,  2 Nov 2020 07:30:39 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 13B542A8CFA;
        Mon,  2 Nov 2020 07:30:39 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 13B542A8CFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1604320239;
        bh=aEmTwdrj/btdI0e9i4Qe2sfidXbJVUp9cG/w1eskNQg=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=h96f4hXAphpLmzUTxftbVRtNAPpIgp63IaJnSCGhg2a2kU7yJ3XpPvxOTRPZHUfdm
         kkhWz/Sx3b4gzZIleAvkpS9K9AtmZoYEWnajYEtiLsu9mdVR5VnJrH73re5fCt/EvX
         ysASZt14XRfFsGEWgYhqZ7gojT5ZFA9A6kUpJI61G4oXLnHoVZQ3ix7w83w9uTawfp
         9y5AB6w+v2zQD1GPg6Wf8eQbjdSPdEVwvOJnN2H7CSac9Qt8V9saC6N9My7+5Se/HH
         EdLcvmhRcocoZU4KIz6C7mTyt2gv1x6MHSCAld1xs6Dd9fCCDW90FVJN+GFZjsiDyN
         j2+wPWMOz5Cug==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id G67eehZORpFi; Mon,  2 Nov 2020 07:30:39 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 025942A8CF3;
        Mon,  2 Nov 2020 07:30:39 -0500 (EST)
Date:   Mon, 2 Nov 2020 07:30:38 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        Peter Oskolkov <posk@posk.io>, Peter Oskolkov <posk@google.com>
Cc:     Michael Kerrisk <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        paulmck <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Turner <pjt@google.com>,
        Chris Kennelly <ckennelly@google.com>, shuah <shuah@kernel.org>
Message-ID: <786665141.6911.1604320238880.JavaMail.zimbra@efficios.com>
In-Reply-To: <20201101200440.17328-1-colomar.6.4.3@gmail.com>
References: <20201101200440.17328-1-colomar.6.4.3@gmail.com>
Subject: Re: [PATCH] membarrier.2: Update prototype
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3975 (ZimbraWebClient - FF82 (Linux)/8.8.15_GA_3975)
Thread-Topic: membarrier.2: Update prototype
Thread-Index: w5tP907+9MIdNZJcHNtLSNKET8NG7w==
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

----- On Nov 1, 2020, at 3:04 PM, Alejandro Colomar colomar.6.4.3@gmail.com wrote:

> The Linux kernel now uses 'flags' and added a new argument: 'cpu_id'.
> These changes were introduced to the kernel
> in commit 2a36ab717e8fe678d98f81c14a0b124712719840.

I doubt the proposed patch with a FIXME and a TODO is appropriate for the man pages project.
It does point out the fact that the membarrier man page needs updating following
Peter's commit though.

Peter (Oskolkov), can you contribute a patch detailing the new membarrier flags and cpu_id
arguments to the man pages project ?

Thanks,

Mathieu

> 
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
> ---
> man2/membarrier.2 | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/membarrier.2 b/man2/membarrier.2
> index 24a24ba86..42b7e2acc 100644
> --- a/man2/membarrier.2
> +++ b/man2/membarrier.2
> @@ -23,6 +23,13 @@
> .\" %%%LICENSE_END
> .\"
> .TH MEMBARRIER 2 2020-06-09 "Linux" "Linux Programmer's Manual"
> +.\" FIXME:
> +.\" The Linux kernel now uses 'flags' and added a new argument: 'cpu_id'.
> +.\" These changes were introduced to the kernel
> +.\" in commit 2a36ab717e8fe678d98f81c14a0b124712719840.
> +.\" The prototype has been updated,
> +.\" but the new features have not yet been documented.
> +.\" TODO: Document those new features.
> .SH NAME
> membarrier \- issue memory barriers on a set of threads
> .SH SYNOPSIS
> @@ -30,7 +37,7 @@ membarrier \- issue memory barriers on a set of threads
> .PP
> .B #include <linux/membarrier.h>
> .PP
> -.BI "int membarrier(int " cmd ", int " flags ");"
> +.BI "int membarrier(int " cmd ", unsigned int " flags ", int " cpu_id );
> .fi
> .PP
> .IR Note :
> --
> 2.28.0

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
