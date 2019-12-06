Return-Path: <SRS0=GXcY=Z4=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F052C2BBE2
	for <linux-man@archiver.kernel.org>; Fri,  6 Dec 2019 18:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AF9D24670
	for <linux-man@archiver.kernel.org>; Fri,  6 Dec 2019 18:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="kI0cWx5N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfLFSAW (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 6 Dec 2019 13:00:22 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42358 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfLFSAW (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 6 Dec 2019 13:00:22 -0500
Received: by mail-qk1-f195.google.com with SMTP id a10so7188417qko.9
        for <linux-man@vger.kernel.org>; Fri, 06 Dec 2019 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=P3LTWZSy3wKY6Vq6kTnLV1Tg9rnX8ii3T/WLf2zHvfQ=;
        b=kI0cWx5NuSFo5k3faOPPdQI0tSENAiIOy+0iW1MIzFCOFEvQw8Elx6iYtXcEDSfNyL
         Gtu+YAXP5mow0XNbpLBkfILQkn0RTJ9EoHgohP/SlgxhcMGmYKq1ctN5S4fYYAVUaWyg
         z4cV0LVDRK2PmjmUFKJPP3NlnU3E2pAYOOhq6q+dBXtuFU7AqfhtujGxf02k0dPjxi/y
         hL+AhKRrNnvH2DNIYYcAfDEZJrfXtIDfZsK7NBHxKYCNVK/2Ie/m9PEnKGclC/QstxZd
         us/75WT+kEtMKAYY8kA8s7aJWQNBgKhcNVbihGh9ctxBM9XgYEickxDgjV4ChkE8qZMI
         86jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=P3LTWZSy3wKY6Vq6kTnLV1Tg9rnX8ii3T/WLf2zHvfQ=;
        b=A6ElBUb5hqDULn/gpL4c7KERl52/IFPTaKvmfW9FqJ8O+fm3juSpFPkWiySe+33LkU
         Bdm4P3QggQRYQqQXrU/GSNzVBgZ0ikDJa6Pl0rGI5FECvOAwVPxp6HXt/KZIco0vJJao
         D50Aywc/TFImKJlaTEc/gA000L30Q6+egZLG2Z1y8BmEzCH0LTt1qmooaOyr6/qZzzRW
         sQ/LLoqR07f2BE+m2ObsBr9SZ+CIHfjIEjiSsp0UZ5nZRnh4EqCCbyEwbi1P9oqDoSKy
         MZnttR/pxLJDvZEcZ811OxPQ6THXDeStAIR4xI7Ea/jDlGbjr6Z5KMar/FO0DicsVlVN
         YuJQ==
X-Gm-Message-State: APjAAAUrpPwLYKWRdHlZWo3MEFdP/KaRdf16S7/3u18k6xEn6a//sfIB
        bJ/EMezITfXlhqDLjh4Xssh3RA==
X-Google-Smtp-Source: APXvYqwP+gBo+6PfKaigR1Kw07O69ViABs/txMEDMfngJPHE5IHMuZN320HNB8zHCAjZM2YVbHEZyw==
X-Received: by 2002:a05:620a:101b:: with SMTP id z27mr14239078qkj.241.1575655220899;
        Fri, 06 Dec 2019 10:00:20 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id p3sm6001073qkf.107.2019.12.06.10.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 10:00:20 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] move_pages.2: not return ENOENT if the page are already on the target nodes
Date:   Fri, 6 Dec 2019 13:00:18 -0500
Message-Id: <BE1B9B9B-17C2-4093-A332-183DF3B6F2A3@lca.pw>
References: <5384814f-c937-9622-adbe-c03e199e0267@linux.alibaba.com>
Cc:     Michal Hocko <mhocko@kernel.org>,
        John Hubbard <jhubbard@nvidia.com>, mtk.manpages@gmail.com,
        cl@linux.com, akpm@linux-foundation.org, linux-man@vger.kernel.org,
        linux-api@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <5384814f-c937-9622-adbe-c03e199e0267@linux.alibaba.com>
To:     Yang Shi <yang.shi@linux.alibaba.com>
X-Mailer: iPhone Mail (17B111)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org



> On Dec 6, 2019, at 12:31 PM, Yang Shi <yang.shi@linux.alibaba.com> wrote:
>=20
> It looks since commit e78bbfa82624 ("mm: stop returning -ENOENT from sys_m=
ove_pages() if nothing got migrated") too, which reset err to 0 unconditiona=
lly. It seems it is on purpose by that commit the syscall caller should chec=
k status for the details according to the commit log.

I don=E2=80=99t read it on purpose. =E2=80=9CThere is no point in returning -=
ENOENT from sys_move_pages() if all pages
were already on the right node=E2=80=9D, so this is only taking about the pa=
ges in the desired node. Anyway, but now it is probably the best time to thi=
nk outside the box redesigning this syscalls and nuke this whole mess.=
