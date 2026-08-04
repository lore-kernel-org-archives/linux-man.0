Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C964BCAD6
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873873; cv=none; b=Sx04tw8hR9S8sPgfpnU/HyKMSrkSdydt21GhQ2A3o1OLT3ycumkl/p1HmM/oaer/FPBxrsH8Oa4UOzrPVfnnPCVrfG8mKJNIfwx3mJe3VoqlQPnISuBDl9EYHLhp3gbgSyNPpMAeeWUACTefjncETbfqVYLmDC6m0HfE7O81bjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873873; c=relaxed/simple;
	bh=LIHCMBPEGbvouVmjJV3zNUsCXi9aLCaiCASrFA51Lmk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=dPhkeZA9yYD+QujVTY6XoGDk0AeYWUSWJZZ8r4l9LTbBykXLtl4Y1/NC/syjokZmDS0aA2/yQxt+FxvKHS2ykRB+TGo79Jy2TNJ61+mPfqcEz4/28BlL2Xmur0Ma9KOmCNP1lbc93uXXudO7eafYSSlwLu0JS//Fwg7f9thnX6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/LXBGn9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/LXBGn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785873870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=VPAt/YTWRut/Z0loszMYSaT0vo5DwdzKVweotBHL+qM=;
	b=M/LXBGn9OMNZZdJY4onzscQoVDUPjVqw1GCQt5IKhtTDxpyBdzzkE6mS2DMVUkqLl8Vzo7
	uOliOpUhWJTv41CY9Ob4SwQJEoWc0J/5n0BNvKMp7QKSoD261VFX4YuSuYEMcXLFvqJ+i7
	qaS/CXUq3EQsMAwk8IOzb4/JEgRgclU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-La0nU7Q-PbiPj403F5fW4g-1; Tue,
 04 Aug 2026 16:04:27 -0400
X-MC-Unique: La0nU7Q-PbiPj403F5fW4g-1
X-Mimecast-MFC-AGG-ID: La0nU7Q-PbiPj403F5fW4g_1785873866
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 286541955BDD;
	Tue,  4 Aug 2026 20:04:26 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.254])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF0B0180044F;
	Tue,  4 Aug 2026 20:04:25 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 674K4OEK391498;
	Tue, 4 Aug 2026 16:04:24 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
In-Reply-To: <anIaZ8X_73ZjmYtR@devuan> (message from Alejandro Colomar on
 Tue, 4 Aug 2026 19:16:17 +0200)
Date: Tue, 04 Aug 2026 16:04:24 -0400
Message-ID: <xnwlu54ppz.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111


What follows is my opinion.  You are free to have a different opinion,
but please don't tell me my opinion is wrong ;-)

Alejandro Colomar <alx@kernel.org> writes:
> It's the Linux Programmer's Manual, and its purpose is that
> programmers on a Linux system are able to write correct programs.

I think I disagree with the scope of "write correct programs" here.
"Write programs that use the APIs in a way that won't break" is not the
same as "write programs that use best practices", but "correct" covers
both.

> The purpose of this documentation is not, and was never supposed to be,
> a technical specification of the implementation.

In the past, that's exactly what man pages were.  You'd get a box of
printed manuals, one or more per section, with one or more pages per
program/file/function being described, and that was the gold standard
reference for the system the books came with.  Heck, even "man man" says
it's for the "system reference manuals".

I think that, in so far as the the developer wants to use our APIs, the
man pages must document what "is" and the information the developer
needs to use the APIs.  Note that I don't say "correctly" because that's
too vague - we should cover the correct way to *call* a function, but
not the correct way to *use* a function - if the programmer wants to
abuse the function for their own purpose, so be it.

If the man pages say what a function does, and what its parameters are,
and what it returns, that is unbiased factual documentation which the
programmer can use as they wish.

Where the man pages go beyond this, we call that "examples", "caveats",
and "best practices" and we have to be careful to disclose that they're
just recommendations.  It is not our place to tell the developer how to
write *their* code, beyond interfacing to our APIs.

I think the man pages need to, where appropriate, document the STANDARD
way of doing things, not what the author thinks might be better, or what
has been historically popular.  In the case of string.h vs memory.h, we
should take guidance from the current relevant published standards,
because future standards will assume that also.  If current standards
conflict with older standards, we could document that (perhaps in a
CAVEATS or HISTORY section).  We should NOT try to anticipate future
standards in the man pages, or suggest "best practices" that rely on
future standards.

> A programmer should be able to write correct code.

We need to leave the definition of "correct" up to the programmer,
outside of "legal API use".  Their code needs to do what they want, not
what we want, so long as the programmer sticks to the standards for our
APIs.

> A piece of documentation that describes an API in detail --as if it were
> reverse-engineering it from its binary code-- but doesn't tell me how
> to use it correctly is useless.

Again with "correct".  We need to document how to use it "according to
what the standards allow and what the function needs and does", and
possibly provide examples and caveats, but avoid trying to say "and you
should use it for these purposes."

> Okay, we have an algorithm.  I'm sure you can implement strncpy(3) from
> that description.  But what is it useful for?  Why would I want to call
> it?

Who cares?  We're not the developers, let them use the function if the
algorithm fits their needs.  We document printf() but don't tell the
developer what data they should print, just *how* to print it.  Same
here.  Tell the developer what the function does, but leave *why* to use
it up to them.

If you want to add a HISTORY section that explains the original purpose
of the function, go ahead.  But that has nothing to do with current
"correct" usage.

> How do I even call it?

That's the API that we need to document.  HOW is relevent here, WHY is
not.

> How am I supposed to write programs in a Linux system?

I think what you want is a programmer's guide.  While that may be
something to include in The Linux Documentation Project, it's outside
the scope of the man pages.  Even the TLDP FAQ says it provide "Guides,
HOWTOs, man pages, and FAQs", which implies that man pages are neither
guides nor HOWTOs.

Do I think we need more documentation to help people write better
software?  Yes!  Do I think the man pages are the right place for that?
No.

> Are there any systems without <memory.h>?

Irrelevant.  If the standard says those functions are in <string.h>,
that's what we should document in the pages for those functions.

