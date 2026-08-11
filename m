Received: from munnari.OZ.AU (unknown [202.29.151.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED47436EA98
	for <linux-man@vger.kernel.org>; Tue, 11 Aug 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.29.151.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453695; cv=none; b=ZDS2daMviwJhj9KkqpdqM96y5PYS+X+vMb7xHvb8Fe7ZC5FVL3P+XtEflE7J4faWEeVSe6+fQnQRpIo1xAPDENjaU+/+YbyKHByzkSxq0K4leIIoCCcwGZQiaHqxP5mOW/cKrku0bJyVVfa3fEQfEiUTwpqSKdB15WEsO47vDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453695; c=relaxed/simple;
	bh=f4crm3EzxjSAKH6wdFShWL0a/xhiTBnFDE8vykzKFZM=;
	h=From:To:cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=mHXMGoSopahaJ5qEdEy2U0EhN7NaKksj7DNqyWFtOF6RGKGfgZR3pcsD2LJneluqKjuLRTreb47IUh93Rllq7VNNED76b/HiyAkSlbMWAkeyFB9O/nc4LcJKyGnRiZb/ExTE/boZUH0N1eODx5tb3YYC5doOi4wwRbyJwt4qIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=munnari.OZ.AU; spf=fail smtp.mailfrom=munnari.OZ.AU; arc=none smtp.client-ip=202.29.151.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=munnari.OZ.AU
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=munnari.OZ.AU
Received: from jacaranda.noi.kre.to ([IPv6:2001:3c8:9009:181:0:0:0:2]) by munnari.OZ.AU with ESMTP
	id 67BCoMFA016365; Tue, 11 Aug 2026 19:50:25 +0700 (+07)
Received: from jacaranda.noi.kre.to (localhost [127.0.0.1])
	by jacaranda.noi.kre.to (8.18.1/8.14.2) with ESMTP id 67BCnIMs006859;
	Tue, 11 Aug 2026 19:49:20 +0700 (+07)
From: Robert Elz <kre@munnari.OZ.AU>
To: Valery Ushakov <uwe@stderr.spb.ru>
cc: Ingo Schwarze <schwarze@usta.de>,
        Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, enh@google.com,
        "G. Branden Robinson" <g.branden.robinson@gmail.com>,
        Alejandro Colomar <alx@kernel.org>,
        Collin Funk <collin.funk1@gmail.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
        bug-gnulib@gnu.org, libc-alpha@sourceware.org, groff@gnu.org
Subject: Re: on project management
In-Reply-To: <ansK_CbsT9JFaOrS@snips.stderr.spb.ru>
References: <ansK_CbsT9JFaOrS@snips.stderr.spb.ru> <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk> <am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me> <20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com> <am_TTjDLlAI68zkp@devuan> <20260803160902.5edjmpxaqr5uudbu@illithid> <CAJgzZorzA1f+KNAj0m56nXxoKywY_pCj2pX3Rg-CgP1P8TnZuA@mail.gmail.com> <86a4r2oqqz.fsf@aarsen.me> <annM6oGYVgXByI5i@isnote.usta.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <19506.1786452558.1@jacaranda.noi.kre.to>
Date: Tue, 11 Aug 2026 19:49:18 +0700
Message-ID: <3881.1786452558@jacaranda.noi.kre.to>

    Date:        Tue, 11 Aug 2026 14:43:56 +0300
    From:        Valery Ushakov <uwe@stderr.spb.ru>
    Message-ID:  <ansK_CbsT9JFaOrS@snips.stderr.spb.ru>

  | [cc'ing kre@ for the first hand information]

Paul Eggert asked me about this sometime in the early hours of (my)
morning.   I remember none of it, but did check the CSRG SCCS
files, and apparently I did create these files for BSD in early
Aug 1985 - probably based upon some kind of description of what
was in System V.   The actual code distributed with 4.4BSD would
have been Chris Torek's ANSI C rewrite though, perhaps 4.3 as well
(I didn't check release dates against SCCS change dates).

I replied to Paul with more details, I saw the reply got to UCLA
mail servers, but whether he received it, or it was treated as
spam, I have no idea.

I do know that some of the listed recipients of this message
will not receive it (@gmail certainly won't, @google probably
not either).  Others, who knows?   (I never will, I treat bounced
mail as spam, and never see it.)

kre
