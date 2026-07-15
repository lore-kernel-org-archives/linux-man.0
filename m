Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647F385D7C
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 21:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784152025; cv=none; b=IENlDRPGgJepeLuDEZUmCMwZoSqbaU3A2DYrCGrVGFtWMwGQCQJM31DTPeWDuUfVIP/3s086jj3HVn8XCzqzB9MfDt+PzjTCET2uwu/UaZajEA+vLq8Bpn8ShS01rmLbyWfRgXHAmWXBc2MB3JN7ACKJkV5in7oFGwrlGiS6xoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784152025; c=relaxed/simple;
	bh=DutvjoGxejyKj8cNxvsgoGwHfjyF55wD3e+egZMlKTY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=K0/D/Pz2LQkBGGVw3PoxpcgO/TS8aEqr8o243r6SE8XFoZ2fAZnPSiCVOUTTZoFJkFBFnVd+X48g6NpAntlkuTvCwOPfrH8uFWPkuZL2k90CzQtaE8ySAs0YActZ5c00JLN2fOiJIPsM0akMaumtLbR9akMhseqq267Lf1bwQSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GeRQSR3V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GeRQSR3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784152021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=GPKHvEbfbwGc7QOSOqWKRYnUEgRxHHhvfJdLkBeveGQ=;
	b=GeRQSR3VO+enCxgbZPYjsea5Wx8NalvtvLw0z5pdSy1B6Kpz9bxG7fkGrt9T4Ucae5rpi6
	WfXoWPp4ZikjvUPwwufuO8BZUodJXrl61m6H4l98r1Edsi2IYsvMveCcB+sxTrPu4p9582
	PkR7CnQg2E1Xd8Tutez8yZ2eP6AalGQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-bcdRh1vyMWyo8zaLEAmshw-1; Wed,
 15 Jul 2026 17:46:55 -0400
X-MC-Unique: bcdRh1vyMWyo8zaLEAmshw-1
X-Mimecast-MFC-AGG-ID: bcdRh1vyMWyo8zaLEAmshw_1784152014
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A7291956063;
	Wed, 15 Jul 2026 21:46:54 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 416AF429;
	Wed, 15 Jul 2026 21:46:54 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66FLkljx1181472;
	Wed, 15 Jul 2026 17:46:48 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
In-Reply-To: <alfwyVnZSgMgWskj@devuan> (message from Alejandro Colomar on
 Wed, 15 Jul 2026 23:09:16 +0200)
Date: Wed, 15 Jul 2026 17:46:47 -0400
Message-ID: <xnik6g6i48.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Alejandro Colomar <alx@kernel.org> writes:
> I find it easier to write documentation in man(7) than in any other
> languages.  It's simple enough that I don't need to remember much.

I can say the same for HTML, because I'm used to it and I stick to
simple constructs.  It's good that there are people who find man(7)
easy, and it's good that those people have found a way to contribute
using their expertese.  I.e. Thank You :-)

>> I've always advocated for "whatever system means the docs are stored and
>> edited with the code, that I can turn into whatever I need."
>
> If you mean store them in a separate file (such as a .3 file next to the
> .c file), I can agree.

I don't mean that.

> If you mean source code comments (that is, in the same file),
> I disagree.

I don't mean that either.

I mean "anything that means one commit has code change and doc change".
I don't care about the mechanism.  Do it either way as long as you do
something.

> You're welcome to send the patches well before they're merged in glibc.

Er, I've been working on tunables for about 3-4 years now.  I doubt
you'd want to hold on to a patch set that long.

In this case, the timing was poor - it finished up just before a release
cycle, so whether the man pages needed to be done now or in six months
was not known until the last minute.  The time from glibc freeze to
glibc release is plenty long enough for a man page review cycle, though.

> For the tests in the build system, I use MANWIDTH=80,
> precisely to maintain a consistent width that is the most common one.

I don't think I've had a default with of 80 for a couple decades now.  I
wish we'd standardized on the 132-column terminals instead.

> So, it's at least as old as 1994.  :)

Um, my career predates that too.  I don't think I was doing man pages
back then, though.

