Received: from smtp1.bureaucracy.de (smtp1.bureaucracy.de [80.190.133.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A93209F38
	for <linux-man@vger.kernel.org>; Wed,  6 Nov 2024 19:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.190.133.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730922436; cv=none; b=J1VPG/XV5Y7NL0sTKianQ28E50HUkkJ0p3w9khjSNQV0iKWj7yaHIh09jRADIbS8I8pRB//9MRLtz1I+CzpR6PfpZpVw0m4sxqNxZslwiwREez6wjHt6Ms/mwr1z4xtU4YCta0VhMWOnAMLWpPPkRFsHuz2do6UQvn7DkueaRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730922436; c=relaxed/simple;
	bh=X7hW8rjoRbY8SabUYA4zcE1f1tE+Ovn3LlHF1Mvf/cA=;
	h=Message-ID:To:Cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:From; b=ar7hR+t+Ue9wjifakemdKp18mMb3bd20tjuKVxs75/v3XWmz+n6yiaW35zwJI+YHeLmNkJqi5MTLv7Rq9tYyPdD97Q2ZGyTdJ0cfVyxaoaeHWhZG1l1WrcKPG7P/fHBugwIpWcE3UMt9x2ZxOFORTeYqEDZq4IQq6sE8UY+K5s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bureaucracy.de; spf=none smtp.mailfrom=bureaucracy.de; arc=none smtp.client-ip=80.190.133.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bureaucracy.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bureaucracy.de
Received: from localhost (<unknown> [2a02:8071:7111:c540:eae6:56fa:7187:2008])
	by smtp1.bureaucracy.de (OpenSMTPD) with ESMTPSA id 715d0912 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 6 Nov 2024 19:47:06 +0000 (UTC)
Message-ID: <011d9f981fa08c8d14bf78627a5de8ed.philipp@bureaucracy.de>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: bind EADDRNOTAVAIL at wrong postition
In-reply-to: <fj7iukibghp5hszfobo4bpghwejfnxzydemlnkamk3346gtivp@xkyeiof2ynft>
References: <67816c00225a0e945f73e22641d4f299.philipp@bureaucracy.de>
 <20241101124840.icu2zoyzbmfnzckd@devuan>
 <9010315d55e27a361142b67cd5816ba4.philipp@bureaucracy.de>
 <auseqaq5nrc3rndajqtapsticsomipqpihgasfcmlnp2sgkczu@amngtstagdta>
 <ef69c2c2493d24f97b0d4938c62603ec.philipp@bureaucracy.de>
 <fj7iukibghp5hszfobo4bpghwejfnxzydemlnkamk3346gtivp@xkyeiof2ynft>
Comments: In-reply-to Alejandro Colomar <alx@kernel.org>
   message dated "Wed, 06 Nov 2024 12:02:15 +0100."
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86730.1730922424.1@hell>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 Nov 2024 20:47:04 +0100
From: Philipp Takacs <philipp@bureaucracy.de>

[2024-11-06 12:02] Alejandro Colomar <alx@kernel.org>
> Hi Philip,
>
> On Wed, Nov 06, 2024 at 11:55:58AM GMT, Philipp Takacs wrote:
> > > Hmmm, then it looks like a documentation bug.  Would you mind sending=
 a
> > > patch?
> > =

> > Actualy I tried to avoid this, because I'm not a big fan of the
> > git-send-email workflow.
>
> Is the issue with sending patches as email, or specific to
> git-send-email(1)?

It's git-send-email(1) specific. This has two reasons:

1. I don't think my vcs should include a mail user agent

2. I would prefere to just add commits as mime attachments

Philipp

> > But a patch is on the mailinglist.
>
> Thanks!
>
> Have a lovely day!
> Alex
>
> -- =

> <https://www.alejandro-colomar.es/>
