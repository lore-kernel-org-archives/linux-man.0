Return-Path: <SRS0=NY7b=7V=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD9BC433E0
	for <linux-man@archiver.kernel.org>; Mon,  8 Jun 2020 11:10:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22D9B2072F
	for <linux-man@archiver.kernel.org>; Mon,  8 Jun 2020 11:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bfs.de header.i=@bfs.de header.b="qLtNjLvr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgFHLKD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 8 Jun 2020 07:10:03 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:46729 "EHLO mx01-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729310AbgFHLKD (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Mon, 8 Jun 2020 07:10:03 -0400
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-sz.bfs.de (Postfix) with ESMTPS id 5C1FD201D2;
        Mon,  8 Jun 2020 13:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1591614601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zVC01RH4vwBrs1mqsRwxLanVsORekgGdkto0rCcsYdY=;
        b=qLtNjLvrsJBNJeSqdLDL+xdlAkIMGdaxbV7vRmUeXzgzv0qovMR+lH9TwDRJCaCxZM+nUK
        O2uTJoXysPkHm2AIKn9zxYE8ukD8WYhKWGaGhnURfwtRtFu8kxTZizWxfuMCMoXYnlGqKM
        dNUG3wxhTHmtH0Wy3wa71Akw/Uz271O8GZcdkw50JgpXIjlVwTF0beJTwpmQI06MDuJ4hj
        nO2G2SUYPtsUBxsV+jZ5jxhP1d9AwPgUdtb0/VMdKD6IysMyDFEBBvJcDr6aJTNQxy8O8x
        34TdfnQbtObcA1Zvyxr5HK5y9qQmzMFRr4fYTEzY3yN8yYvTnwH6sRhxCKpbNQ==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 8 Jun 2020
 13:10:00 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Mon, 8 Jun 2020 13:10:00 +0200
From:   Walter Harms <wharms@bfs.de>
To:     John Marshall <John.W.Marshall@glasgow.ac.uk>,
        "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>
CC:     "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: AW: [patch] random.3: wfix: RAND_MAX is for rand(3)
Thread-Topic: [patch] random.3: wfix: RAND_MAX is for rand(3)
Thread-Index: AQHWPYSXs4CUHQyQf0i9Em/+EFgdCqjOjqei
Date:   Mon, 8 Jun 2020 11:10:00 +0000
Message-ID: <f653054ab6ae480b8286386c432cf8b9@bfs.de>
References: <02185B3C-F6E5-4674-BB34-E549E04C5B37@glasgow.ac.uk>
 <627c601ec03b4da9b1ce98ee0e61a6ba@bfs.de>,<20200608110416.GA21314@Johns-MacBook-Pro.local>
In-Reply-To: <20200608110416.GA21314@Johns-MacBook-Pro.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Authentication-Results: mx01-sz.bfs.de;
        none
X-Spamd-Result: default: False [-1.56 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         TO_DN_SOME(0.00)[];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-1.019];
         FREEMAIL_TO(0.00)[glasgow.ac.uk,gmail.com];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-1.56)[92.12%]
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

just a nit pick:
INT32_MAX  is not mentioned in the POSIX page, just drop it.

________________________________________
Von: linux-man-owner@vger.kernel.org <linux-man-owner@vger.kernel.org> im A=
uftrag von John Marshall <John.W.Marshall@glasgow.ac.uk>
Gesendet: Montag, 8. Juni 2020 13:04:16
An: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org
Betreff: [patch] random.3: wfix: RAND_MAX is for rand(3)

POSIX fixes random()'s range at 2^31-1; RAND_MAX may be smaller on some
platforms (even though with glibc or musl on Linux they are the same).
---

On Sat, Jun 06, 2020 at 12:45:58PM +0000, Walter Harms wrote:
> that RAND_MAX is 2^31-1 in some cases does not matter. IMHO
> it is wrong to mention RAND_MAX in the random page. it can
> simply be replaced with (2**31-1)

Thanks for confirming, Walter. I forgot to mention I was happy to
provide a patch -- suggested fix in this git-format-patch message.

    John

 man3/random.3 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man3/random.3 b/man3/random.3
index 76b076f42..e3550f802 100644
--- a/man3/random.3
+++ b/man3/random.3
@@ -69,7 +69,7 @@ The
 function uses a nonlinear additive feedback random
 number generator employing a default table of size 31 long integers to
 return successive pseudo-random numbers in
-the range from 0 to \fBRAND_MAX\fR.
+the range from 0 to 2^31\ \-\ 1.
 The period of this random number generator is very large, approximately
 .IR "16\ *\ ((2^31)\ \-\ 1)" .
 .PP
@@ -125,7 +125,9 @@ or be the result of a previous call of
 The
 .BR random ()
 function returns a value between 0 and
-.BR RAND_MAX .
+.BR INT32_MAX ,
+i.e.,
+.IR "(2^31)\ \-\ 1" .
 The
 .BR srandom ()
 function returns no value.
--
2.18.2

