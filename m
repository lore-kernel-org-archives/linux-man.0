Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E68CC4332F
	for <linux-man@archiver.kernel.org>; Sat, 12 Nov 2022 14:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbiKLOyS (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 12 Nov 2022 09:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbiKLOyS (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 12 Nov 2022 09:54:18 -0500
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F8A204
        for <linux-man@vger.kernel.org>; Sat, 12 Nov 2022 06:54:16 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,159,1665475200"; 
   d="scan'208";a="89686258"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 12 Nov 2022 06:54:15 -0800
IronPort-SDR: LX3Ug+swcAwDjxU09k5DvZ85m8CL/PBNkC872ip3lGg7Xl4qgQ684MvQwU+nwA0xiVt79wMZqk
 Bu/4IEUuwugdNQuSA+SxheeoUL57j834jeyYSrVs47qw5LUZkHEmHF/8/Mp4fqflDDwd6IU+it
 bIpNSPdeIn5ukc8mDZsqAjltlhFm054Oic7tOyK+hz3UJOzH7ca6UiVM83bvM/jeWnssDivk3i
 zagSBkndVyzV2i3/59xnPqum4G0Pave/VQ+yN9BZYiQVh2n5gxTdATGj0EXmO3Cqdu4+ALlgY+
 srw=
Date:   Sat, 12 Nov 2022 14:54:10 +0000
From:   Joseph Myers <joseph@codesourcery.com>
To:     Alejandro Colomar <alx.manpages@gmail.com>
CC:     Martin Uecker <uecker@tugraz.at>, Ingo Schwarze <schwarze@usta.de>,
        JeanHeyd Meneide <wg14@soasis.org>,
        <linux-man@vger.kernel.org>, <gcc@gcc.gnu.org>
Subject: Re: [PATCH] Various pages: SYNOPSIS: Use VLA syntax in function
 parameters
In-Reply-To: <a1606206-294d-8f7d-eb1d-e8ffe7d3212c@gmail.com>
Message-ID: <5ae032cd-7a5f-f72b-29ae-6ad7f418da8@codesourcery.com>
References: <20220826210710.35237-1-alx.manpages@gmail.com> <CACqA6+mfaj6Viw+LVOG=nE350gQhCwVKXRzycVru5Oi4EJzgTg@mail.gmail.com> <491a930d-47eb-7c86-c0c4-25eef4ac0be0@gmail.com> <2abccaa2-d472-4c5b-aea6-7a2dddd665da@gmail.com> <4475b350c2a4d60da540c0f3055f466640e6c409.camel@tugraz.at>
 <fcf6f3f7-f61d-9b91-bfeb-370849439ce3@gmail.com> <d524528c29f806b763a2d394abc1241f6b2dc0cb.camel@tugraz.at> <51f5a2f2-84c1-bc75-cf94-0cdc1771d37f@gmail.com> <4e3fee795769544738b3dc793aa95d6b34b72047.camel@tugraz.at> <e9ba79ff-fb73-c4d4-b966-d8d15062f7b7@gmail.com>
 <69d694b3-756-792d-8880-87bab482ea34@codesourcery.com> <76c083af-c01f-a4b2-3df-c83075c6b0de@codesourcery.com> <ab605ae5d4c89a453a433717c2e5fe0134e90803.camel@tugraz.at> <75c352c-e8b5-90d0-5fae-7b211c647934@codesourcery.com> <68746776-87bf-80f9-8e3e-7392e8cef1bb@gmail.com>
 <77c3557f-4a62-3ede-4df4-4b2b78e265b1@codesourcery.com> <a1606206-294d-8f7d-eb1d-e8ffe7d3212c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-12.mgc.mentorg.com (139.181.222.12) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sat, 12 Nov 2022, Alejandro Colomar via Gcc wrote:

> Since it's to be used as an rvalue, not as a lvalue, I guess a
> postfix-expression wouldn't be the right one.

Several forms of postfix-expression are only rvalues.

> > (with a special rule about how the identifier is interpreted, different
> > from the normal scope rules)?  If so, then ".a = 1" could either match
> > assignment-expression directly (assigning to the postfix-expression ".a").
> 
> No, assigning to a function parameter from within another parameter
> declaration wouldn't make sense.  They should be readonly.  Side effects
> should be forbidden, I think.

Such assignments are already allowed.  In a function definition, the side 
effects (including in size expressions for array parameters adjusted to 
pointers) take place before entry to the function body.

And, in any case, if you did have a constraint disallowing such 
assignments, it wouldn't suffice for syntactic disambiguation (see the 
previous point I made about that; I have some rough notes towards a WG14 
paper on syntactic disambiguation, but haven't converted them into a 
coherent paper).

-- 
Joseph S. Myers
joseph@codesourcery.com
