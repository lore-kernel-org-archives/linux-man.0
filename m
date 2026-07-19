Received: from mail.smrk.net (mail.smrk.net [45.76.87.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295A30CD82
	for <linux-man@vger.kernel.org>; Sun, 19 Jul 2026 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.87.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495570; cv=none; b=MUn8PHhU07wUWvxtMIe11QrsLUrhaze9xK9AaYBr1jw8ZuXjL68kmN84kYpIzbfEbzmPnRZJ/HbKt85RiiJ8VjE+Op4KqKTYos00xswfgihlbojFbReYy0I4HD8Q+6bKgmY+jUnFHYcnAWFvkPCtv2fltcBWplmyH5f9K2teCtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495570; c=relaxed/simple;
	bh=vZ4/eC+eWkalfwC3yA8uedAjoScYZmaOgJY5YT5r8RE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fIIDUpon7HlfZB1tM1PMCMldgJKTXswzXM4/8qg5WcRJRCzyXNPN9yL+NvRi6HmC9IJWxp4uG/O+8g6aYOZHihlOVkHt3OfT4Ldd6tqoi3LQlEsOnfw6YUlEdFvLJRHFtyKnak/6fPcKNCGiOpoh+7YfvpwIDeconSl0wsKHNO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net; spf=pass smtp.mailfrom=smrk.net; dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b=b65e6Ghj; arc=none smtp.client-ip=45.76.87.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smrk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b="b65e6Ghj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smrk.net; s=20221002;
	t=1784495558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfMOiujb4lHkQEz17UeTDdaYKJ+P44nyRjzy/sILUb4=;
	b=b65e6GhjfCoCQ/yoeU90rdwmWJqIclnlLNtEFLovZp5XW/mGR+CjJ5ms5MsM8eallVY1pP
	zM4K00XescdbsSKjhztOVeDyAYYkaKRh95Tv3rDHCgq7KWbagK67WDaQMOsTzrc+sGa7C6
	SHTflY+gRIz+W+ug/Ihxs6wt8vE2ISuWGQcMm6fDmootX1T5RcX4nkTevwt2fxoLoAzjyP
	8WJ+Fl7uT4z3LaGDGjNNp43/V5FEiKvuJ0qIAy1DejrHqsojdSkrUPjcMohcnGiXM1DQLR
	g8LuSoVZlwuPOuBRn0fpkabfDPoZwWBuNmlNyYSl/yMMESlzKwfy7TgRIFAviQ==
Received: from localhost (<unknown> [192.168.5.2])
	by smrk (OpenSMTPD) with ESMTPSA id 76248ea1 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 19 Jul 2026 23:12:38 +0200 (CEST)
From: =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, =?utf-8?Q?G=C3=BCnther?= Noack
 <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>
Subject: Re: [PATCH 3/3] man/man7/landlock.7: wfix
In-Reply-To: <alttHBBoVW2Vej6u@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net>
 <20260709153422.210312-3-stepnem@smrk.net> <alEh_O7UT8cjcxMq@devuan>
 <20260713114855Z.2240445002-stepnem@smrk.net> <alttHBBoVW2Vej6u@devuan>
User-Agent: Notmuch/0.40 (https://notmuchmail.org) Emacs/31.0.50
 (x86_64-pc-linux-gnu)
Date: Sun, 19 Jul 2026 23:12:38 +0200
Message-ID: <20260719211238Z.2327494602-stepnem@smrk.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Jul 2026 14:17:57 +0200
Alejandro Colomar wrote:

> On 2026-07-13T13:48:55+0200, =C5=A0t=C4=9Bp=C3=A1n N=C4=9Bmec wrote:
>> FWIW I see little point in this kind of duplication, given
>> that the kernel docs are as readily available to anyone
>> interested as the man pages are;
>
> Not so much; the manual pages are available for anyone on a terminal
> without internet connection.  The kernel docs are only available if you
> have the kernel sources or internet.

No, I really don't see a difference here: I don't know a
Linux distro that doesn't provide the kernel docs as a
package.  (You seem to be using Debian and/or its
derivatives, so that would be the linux-doc package.)

> So, the manual pages are necessary.  What I wonder is if the kernel
> documentation is necessary.  I think they could drop it (the duplicated
> part of it), and refer to the manual page.  However, I trust they know
> what's best for them.

In principle, if the docs are maintained by kernel
developers, the other way round, i.e., preferring the kernel
docs, makes more sense to me: being in the same source tree,
their maintenance is less likely to be forgotten or
neglected (there might also be other factors, such as reST
likely being less taxing to work with than roff for most
people).

--=20
=C5=A0t=C4=9Bp=C3=A1n
