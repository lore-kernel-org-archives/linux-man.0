Return-Path: <SRS0=j4e1=77=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A793EC433E1
	for <linux-man@archiver.kernel.org>; Thu, 18 Jun 2020 14:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8311D20888
	for <linux-man@archiver.kernel.org>; Thu, 18 Jun 2020 14:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bfs.de header.i=@bfs.de header.b="pKpGnXzB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgFROsA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 18 Jun 2020 10:48:00 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:28970 "EHLO mx01-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726927AbgFROr5 (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Thu, 18 Jun 2020 10:47:57 -0400
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-sz.bfs.de (Postfix) with ESMTPS id BC6612010F;
        Thu, 18 Jun 2020 16:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1592491674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G9NVVD1N/uRcMq7lhd2zTTZDfCws+SZDw9j4nJCt3fQ=;
        b=pKpGnXzBZDOUwg/J8CsEtYlqH3YQ+GsU6VV9auj/Pu9TSw+jAR/BKGD5zdOSW9+QxgDp4e
        ElGi7+2BW95FcyV4R8mMUkfaEtXxxKyiJFO39UEJwGXG+2lp2CLW474a8EYtK5wOEJfMg1
        3aaQg6Y4GRCJ3Phdl/EyckPkH00Wum2QzlCtC/oFVFo5+Qmaeat5AIq9fcg22ijyhY0ZHW
        SJcNbQT21N5eh5BjE+vtI71nKi40aVH2KkzxPhoIw3RMtgKmtKM5J2U3a0E+C6WG6TqWKC
        LYa37KV5S9ddkuD6DmPv2UuSOgfS1xRWH3J3FevkQYMddKV7q0ntyQ10zkJ1wg==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Thu, 18 Jun
 2020 16:47:54 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Thu, 18 Jun 2020 16:47:54 +0200
From:   Walter Harms <wharms@bfs.de>
To:     Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
CC:     "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>,
        "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: AW: [PATCH] fread.3: Add example
Thread-Topic: [PATCH] fread.3: Add example
Thread-Index: AQHWRNqZsZlOY/GUP0iTGXI/zRsqmqjeDiq7gAAxoICAADFVag==
Date:   Thu, 18 Jun 2020 14:47:54 +0000
Message-ID: <80edb808679e48cc905421345c249127@bfs.de>
References: <20200617184530.20811-1-arkadiusz@drabczyk.org>
 <be5391cc853c41a683069fa0c42d0a88@bfs.de>,<20200618133647.rq2w6lanuatoweri@comp.lan>
In-Reply-To: <20200618133647.rq2w6lanuatoweri@comp.lan>
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
X-Spamd-Result: default: False [-0.06 / 7.00];
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
         BAYES_HAM(-0.06)[61.36%];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.983];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[]
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


________________________________________
Von: Arkadiusz Drabczyk [arkadiusz@drabczyk.org]
Gesendet: Donnerstag, 18. Juni 2020 15:36

>>
>> +    ret =3D fread(buffer, 1, 1, fp);
>> +    if (ret !=3D 1) {
>> +        fprintf(stderr, "fread() failed: %zu\en", ret);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> please drop a line what case you want to explain here, looks like the sa=
me as above.

>As said a few lines above, this retrieves ELF class. I wanted to show
>that file pointer moves automatically after fread() finishes.

ok i get the point(s).
1. you show you can read an "item" a bunch of bytes

the second read() should demonstrate that consecutive reads return
 consecutive blocks of data (here the magic and class id of an ELF).

perhaps you can support what want to show with a
printf("pos=3D%ld\n",ftell(fp));
before and after read.

hope that helps,
re,
 wh

--
Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
