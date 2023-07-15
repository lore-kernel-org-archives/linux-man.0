Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F17C001B0
	for <linux-man@archiver.kernel.org>; Sat, 15 Jul 2023 19:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjGOTHN (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 15 Jul 2023 15:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjGOTHH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 15 Jul 2023 15:07:07 -0400
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [217.114.79.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34937B3
        for <linux-man@vger.kernel.org>; Sat, 15 Jul 2023 12:07:05 -0700 (PDT)
Received: by luonnotar.infodrom.org (Postfix, from userid 10)
        id 26C1A408131; Sat, 15 Jul 2023 21:07:03 +0200 (CEST)
Received: by finlandia.home.infodrom.org (Postfix, from userid 1000)
        id E392BCA0298; Sat, 15 Jul 2023 21:04:36 +0200 (CEST)
Date:   Sat, 15 Jul 2023 21:04:36 +0200
From:   Joey Schulze <joey@infodrom.org>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man@vger.kernel.org
Subject: Re: SPDX license review requests
Message-ID: <ZLLtxEUlQzc60X3f@finlandia.home.infodrom.org>
References: <a7ed2025-b896-bbce-f36b-0a681f38c542@gmail.com>
 <ca053426-bd13-055a-88ab-9a4873f13f7e@gmail.com>
 <ZHXweLNKqHKoybXM@tassilo>
 <eda85fda-6182-fc13-3943-9084b187433e@gmail.com>
 <CAK719L2PjTr=-c_AEi89TVrJV7DHwyfBJjH6z6Bozc0Rk+rOfQ@mail.gmail.com>
 <b164d81c-225f-f450-c28a-f4aa9f219448@os.amperecomputing.com>
 <e8f9685b-ef42-6d0f-c18e-861a26922f6e@Shaw.ca>
 <978e3f22-8017-eb91-0737-9a043c335122@gmail.com>
 <ZKnDqEF+RFVUyW+Y@finlandia.home.infodrom.org>
 <abcc8ad5-8d4e-ce7c-d7d2-1d5ad599c4a8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <abcc8ad5-8d4e-ce7c-d7d2-1d5ad599c4a8@kernel.org>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex!

Alejandro Colomar wrote:
> We're using SPDX now, so it will be more like this:
> 
> .\" Copyright (c) 2001 Martin Schulze <joey@infodrom.org>
> .\"
> .\" SPDX-License-Identifier: GPL-2.0-or-later
> .\"
> 
> 
> I guess that's good to you, right?

This is fine with me.

Regards

	Joey

-- 
Unix is user friendly ...  It's just picky about its friends.
