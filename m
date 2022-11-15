Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DC7C4332F
	for <linux-man@archiver.kernel.org>; Tue, 15 Nov 2022 17:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiKORAi (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 15 Nov 2022 12:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiKORA2 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 15 Nov 2022 12:00:28 -0500
X-Greylist: delayed 558 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Nov 2022 09:00:26 PST
Received: from mailgw-k01.its.kfa-juelich.de (mailgw-k01.its.kfa-juelich.de [134.94.4.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93F72C109
        for <linux-man@vger.kernel.org>; Tue, 15 Nov 2022 09:00:26 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by mailgw-k01.its.kfa-juelich.de (Postfix) with ESMTP id 1B9D73603D3;
        Tue, 15 Nov 2022 17:51:07 +0100 (CET)
Authentication-Results: mailgw-k01.its.kfa-juelich.de (amavisd-new);
        dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
        header.d=fz-juelich.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fz-juelich.de; h=
        content-transfer-encoding:content-type:content-type:subject
        :subject:from:from:content-language:user-agent:mime-version:date
        :date:message-id:received:received:received; s=main; t=
        1668531064; bh=SrwvdHN1Mps2Xy0Y2lwps7O0LViQwmoW1SoBQxyPsig=; b=F
        BOZI06Tcr6lCwqkPqhD3nOO47PvTXCQfrL0xWyysShxbaObJ69HCgB05z9XXSVWy
        BtnQxPhrkuLDlk+mCioPc0XJ9WiGpyAW3pWgGEbbuPPKdIWJA2tC4JVT7w9hmqEV
        dK1UM/6tDuzYQFChJCB3vf0EKVW1GLhK+X5/QV+3aQ=
X-Virus-Scanned: Debian amavisd-new at mailgw-k01.its.kfa-juelich.de
Received: from mailgw-k01.its.kfa-juelich.de ([127.0.0.1])
        by localhost (mailgw-k01.its.kfa-juelich.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RJyJDg_EK6hi; Tue, 15 Nov 2022 17:51:04 +0100 (CET)
Received: from exch2016-e2.ad.fz-juelich.de (exch2016-e2.its.kfa-juelich.de [134.94.4.36])
        by mailgw-k01.its.kfa-juelich.de (Postfix) with ESMTPS;
        Tue, 15 Nov 2022 17:51:04 +0100 (CET)
Received: from [192.168.33.165] (193.49.43.137) by
 exch2016-e2.ad.fz-juelich.de (134.94.4.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.13; Tue, 15 Nov 2022 17:51:02 +0100
Message-ID: <9ed5e1a7-7003-e31f-1a39-62d2c3e718cc@fz-juelich.de>
Date:   Tue, 15 Nov 2022 17:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     <mtk.manpages@gmail.com>, <alx.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
From:   Joachim Wuttke <j.wuttke@fz-juelich.de>
Subject: man ld(1): see also ldd, ldconfig
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [193.49.43.137]
X-ClientProxiedBy: exch2016-e2.ad.fz-juelich.de (134.94.4.36) To
 exch2016-e2.ad.fz-juelich.de (134.94.4.36)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

I'd suggest to add ldd and ldconfig to the "see also" section of man ld,
because those are the man pages you need when desperately debugging
ld failures on misconfigured systems.

Thanks for all your work on the Linux man pages project, Joachim


---------------------------------------------------------------------------=
---------------------
---------------------------------------------------------------------------=
---------------------
Forschungszentrum Juelich GmbH
52425 Juelich
Sitz der Gesellschaft: Juelich
Eingetragen im Handelsregister des Amtsgerichts Dueren Nr. HR B 3498
Vorsitzender des Aufsichtsrats: MinDir Volker Rieke
Geschaeftsfuehrung: Prof. Dr.-Ing. Wolfgang Marquardt (Vorsitzender),
Karsten Beneke (stellv. Vorsitzender), Prof. Dr. Astrid Lambrecht,
Prof. Dr. Frauke Melchior
---------------------------------------------------------------------------=
---------------------
---------------------------------------------------------------------------=
---------------------
