Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09853F54A0
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152708; cv=none; b=quj8NLKfbPBB0DG+fBB2DSEVskLNZu1BUJPU5uPUQDggCwU0zIrMrdxFaQGbwZvUsSm0avbLiZAVSrAMGlXdHLUYiX15wxzjdxV1u9fZCUPqa0PNTQJVRfsIRhQiXUw+hSr3ZbM83ekKMTHwG3DTwAYfV4itS9ukGdo9D/DFeiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152708; c=relaxed/simple;
	bh=Ya6gS+rnxCVbKdmafPo1Z+5nu9DwsBC4AkO4Tu2W5wY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EBxnubUHccMK4psyHcC9HqfI3xrVPrmdWUpK0jWie5FU+DrV/mmTMkYViwqGCeLrH6lDim8HQI401AN5P/0ialoNqMLW3W6RpOmjEvD1f+KIBM36QjYq5xPHLNnJecFK9B+mhU3KZOc/SHEZsPmxtHFfu4Y7A4//Bkhi2Z+hGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OgA9I9lr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgA9I9lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790152693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Tf5LHlOgHaXKjFCfonrlheCc6UXBK6WEAYSufnAHiU=;
	b=OgA9I9lrG8ztNeGl/uLeL2gwwRqB1PJiWDJlYMBR4l4ZurKmPRa6TpsbeEv7B4l4fOKhJ/
	YJAjMZQwOVUzgh9aNavul/8AbK8nvIpU1jizWQw/Wp1zPSIQ4N+b47Y3B7KzCzu1YKb9iJ
	cAgvgchd/ayj/mCxS6hLS9/wad3XJU4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-xp88KbJTMM-o6EVd-NrrSw-1; Wed,
 23 Sep 2026 04:38:08 -0400
X-MC-Unique: xp88KbJTMM-o6EVd-NrrSw-1
X-Mimecast-MFC-AGG-ID: xp88KbJTMM-o6EVd-NrrSw_1790152687
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40A851964CE6;
	Wed, 23 Sep 2026 08:38:06 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BA8530002C2;
	Wed, 23 Sep 2026 08:38:03 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Rich Felker <dalias@libc.org>
Cc: John Scott <jscott@posteo.net>,  musl@lists.openwall.com,
  tg@trevorgross.com,  linux-man@vger.kernel.org,
  libc-alpha@sourceware.org
Subject: Re: [musl] Re: async-signal-safety of chroot
In-Reply-To: <20260923044048.GU23438@brightrain.aerifal.cx> (Rich Felker's
	message of "Wed, 23 Sep 2026 00:40:48 -0400")
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
	<20260923013428.GT23438@brightrain.aerifal.cx>
	<5db76d666377410fc105b9d527cbcd9f9ef3b332.camel@posteo.net>
	<20260923044048.GU23438@brightrain.aerifal.cx>
Date: Wed, 23 Sep 2026 10:38:01 +0200
Message-ID: <lhu4ifge51y.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

* Rich Felker:

> On Wed, Sep 23, 2026 at 04:17:03AM +0000, John Scott wrote:
>> On Tue, 2026-09-22 at 21:34 -0400, Rich Felker wrote:
>> > Since it's no longer standard, there is no standard governing chroot,
>> 
>> On this claim only, I believe you're technically mistaken: ISO/IEC
>> 23360-1-2:2021 (Linux Standard Base: Core specification generic
>> part) is a current International Standard. It incorporates the
>> definition of chroot() from SUSv2 by reference without amendment, so
>> the same async-signal-safety limitations apply.
>
> Linux Standard Base is not relevant. It is not a standard musl aims to
> conform to, and it is largely an ad hoc third party description of a
> very old version of the glibc ABI and its integration into Red Hat
> Linux.

And glibc does not aim to conform to Linux Standard Base, either.  Only
very few architectures meet the symbol version requirements in ISO/IEC
23360-1-2:2021.  Any architecture that was added after glibc 2.3 is not
compliant (not even with the generic part).  This is a defect in the
standard.

Thanks,
Florian

