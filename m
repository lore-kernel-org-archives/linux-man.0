Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCB73D9026
	for <linux-man@vger.kernel.org>; Wed, 25 Feb 2026 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034539; cv=none; b=McdGoq7P08UilgzAXwgPIhjD+CtiPH61KF/YJPk1C9Sf1KlOLf2kuiXyZtnkQSVmUuWqBXy41Ami4yRkIKjtSHlqFhYBdk8pQHpkNllvLE19IQElaPS0UGej612XWjGG76H1GBLD6GfwjT3k0JDpUM9Arw+bLaEL7vGVvNhyh/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034539; c=relaxed/simple;
	bh=3gqzR38uG+e4n3E37szHBEIG+s4Q0a8YDPjOUECjpOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQoh45eArlQEebKC5WuhKOdH7exmVGkLESrfzNe1QOcLag9JVVAMiVy5I/zEFF1YBbu5DkkGF0+rEeKVpjkXJmw7wfIJR5wh7uuZiYPUEIQaKrd4Ytq1JiTUX2qUBoV7hRDx9rcZf44g+Nb3nttf704dA8K8yWCtdoASsbHbJXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rkta.de; spf=pass smtp.mailfrom=rkta.de; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rkta.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rkta.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fLfC91xZKz9vVQ;
	Wed, 25 Feb 2026 16:48:53 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@rkta.de designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=mail@rkta.de
Date: Wed, 25 Feb 2026 16:48:50 +0100
From: Rene Kita <mail@rkta.de>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: QChar and QVoid for strchr(3), memchr(3), et al.
Message-ID: <20260225154850.GA35324@x220.rkta.de>
References: <aZ2xBQcy7mMEXW_b@devuan>
 <20260224185233.GE43043@x220.rkta.de>
 <aZ4Y_-MagoDmdE9g@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ4Y_-MagoDmdE9g@devuan>
X-Rspamd-Queue-Id: 4fLfC91xZKz9vVQ

On Tue, Feb 24, 2026 at 10:41:58PM +0100, Alejandro Colomar wrote:
> Hi Rene,
> 
> On 2026-02-24T19:52:33+0100, Rene Kita wrote:
> > > -  In the SYNOPSIS, do you prefer QChar/QVoid or overload style?
> > > 
> > > 	QChar *strchr(QChar *s, int c);
> > >    vs
> > > 	char *strnul(char *s);
> > > 	const char *strnul(const char *s);
> > 
> > IMHO the overload style is more appropriate for the next few years.
> > Everyone who has at least read K&R C will understand it.
> 
> Ok.
> 
> > For technical correctness the QChar/QVoid style should be mentioned, though.
> > That's why...
> > 
> > > -  If we document it as QChar/QVoid, I guess we should we add a
> > >    QChar(3)/QVoid(3) manual page documenting all of the details, to
> > >    avoid duplicating such details in each manual page.
> > 
> > these man pages should be created in either case.
> > 
> > > -  How much should we document the old function?  Should we keep that as
> > >    a historic detail in the QChar(3)/QVoid(3) page?
> > 
> > As I usually don't deal with C23 - and don't expect this to change for a
> > few years - I would prefer to have the old function documented. It might
> > be that I work on a C99 project while viewing the latest man pages on a
> > Arch system.
> 
> A problem, even if you write C99 on your project (let's say mutt(1), for
> example), is that the compiler will default to something newer, and
> you'll be exposed to those APIs.  If they're not documented, you'll be
> quite surprised that your code suddenly fails.  So I think they should
> be documented.  Of course, the old function would also need to be
> documented, because otherwise people might be surprised the other way
> around.
> 
> Hmmm, how about something like this?
> 
> 	SYNOPSIS
> 		#include <string.h>
> 
> 		char *strchr(char *s, int c);
> 		const char *strchr(const char *s, int c);
> 
> 		#undef strchr
> 		char *strchr(const char *s, int c);
> 
> Plus a paragraph in HISTORY clarifying this.

Without the context I already have, I don't think I would understand
what's meant with this #undef. Maybe better "Before C23" or "Former
version" or something, but I'm just brainstorming here...

I'm not even sure if it has to be mentioned in the SYNOPSIS. OTOH,
C23 brings some breaking changes and it might help people save time when
those differences are clearly mentioned.
