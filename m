Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37EFEE49A3
	for <linux-man@archiver.kernel.org>; Wed, 23 Aug 2023 02:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbjHWCyv (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 22 Aug 2023 22:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjHWCyv (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 22 Aug 2023 22:54:51 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:54:49 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A791A5
        for <linux-man@vger.kernel.org>; Tue, 22 Aug 2023 19:54:49 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-47-64e55c890656
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 21.18.10987.A8C55E46; Wed, 23 Aug 2023 06:10:34 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=QjMC1vDY8PkfWW5tX4823E/o7oL8yXNwuVx40wI58WO87y9NTduJLJeCPb9dndiqb
          FHtmb/I949lJ6P2tRJ+nrdLMpVaSTbT8vLjB8zBmd+tbQVsN0465EQ98FN0n+Zoqa
          px7wAjkQcrvZBV2E8tBdVAX/mBiO8pmBQRy07oWmU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=BPT15s4lw2uF7+2hFTE/hIeP2NaKmNAD9onEmwc1dPvg+hEv7HybEjnCVBuf3BrQ2
          RG2OdiPJiM2k29ByvbI6rs3HtrYUZE5xIAzQD3JZWUiWsc7E0yQBJWVY6XHGKhTlA
          0FbTCqVpclo2Sizrvd95LnrC4fUpSSGnRSQpgY8BQ=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:03 +0500
Message-ID: <21.18.10987.A8C55E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-man@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:17 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGW7cr5mmKweVPAhZr1s9gd2D0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCR6D/5jLWLkYtDSGAP
        k8T6x92MIA6LwGpmiYsbu1khnIfMEn8WnWOBKGtmlFj77yNYP6+AtcSUr5cZQWxmAT2JG1On
        sEHEBSVOznzCAhHXlli28DVzFyMHkK0m8bWrBCQsLCAm8WnaMnYQW0RAVuL/0p1gI9kE9CVW
        fG0GG8kioCpxcNN7VhBbSEBKYuOV9WwTGPlnIdk2C8m2WUi2zULYtoCRZRWjRHFlbiIw2JJN
        9JLzc4sTS4r18lJL9AqyNzECA/F0jabcDsallxIPMQpwMCrx8P5c9yRFiDWxDKjrEKMEB7OS
        CK/094cpQrwpiZVVqUX58UWlOanFhxilOViUxHlthZ4lCwmkJ5akZqemFqQWwWSZODilGhjP
        H3Z4wbdjIUf4mqnGX9VKVf5EL+O4tP/JNrZppYVSC9Puiq7bfP1WZ8s9Xvu7SZP8ZgcWqdXW
        8Rw3/nk/TuDUAvaNSi428wKj75po7fP6HH0wbr7NWr0fxkaLb7az/FXL+nX6jnJByKH7h95r
        7jv/yZRv7ooJSbP+7dJI/PKC56jRjT9b9ppGKrEUZyQaajEXFScCAMjgIG5AAgAA
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

