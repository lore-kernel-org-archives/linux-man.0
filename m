Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143223955EA
	for <linux-man@vger.kernel.org>; Fri, 25 Sep 2026 19:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366108; cv=none; b=j4Pr5AIvryGDINgID+wX4bn/Wlpx6mgfdBKnWYsMHBLsVFWU5xS7mva948bOBg8IslLTevchcak1FchvJjGL3hcd59EzE5deQypr7tZS+/9XSzBwfX1eqWIuRdxDW1D3QochrBZaI4CwveFu4OLqu5s4okDT8UrdpmexWTwLW7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366108; c=relaxed/simple;
	bh=VAYx2Qzp30BDLeHyjHKkGaMW63Lk2SDdL/cg4JsHDTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oQCwdafsc3cQkztnoWAwjTwiUCoQbn2JK7tu0SK0iDqhK1zLEC427Lt/k/Z8xfOh658y8uvMgOXXI6Y+ziH0xwDINus1NnFWPepvhvxd3aJfOleITh9V85eJwWw07sYmYS0tLcJYsSnzHft/kzFNqOkL7Q9xxR+uS3eRV1pyXIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F7AJTCd1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F7AJTCd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790366105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7R8g2g5io5Mc6RO3UGBOrZqqRoN8DE1RnEMk++o65BA=;
	b=F7AJTCd1Vl0dGN2GCSnlegoObUmgUQ4FsLZoG9JgaXRU9mo6II1N4VImJWR2L5fXLrtNvN
	XASgNsZognq3QhVLfXOnLzTbhXKBolmhY64HehbN0cEkTwugkI52sQ7hOzjcoine/GLybo
	3SAOBznN+puzSVlKWaZ5CHJC633ddjA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-o8NgNQbtMVmEIv14y3B1kA-1; Fri,
 25 Sep 2026 15:55:00 -0400
X-MC-Unique: o8NgNQbtMVmEIv14y3B1kA-1
X-Mimecast-MFC-AGG-ID: o8NgNQbtMVmEIv14y3B1kA_1790366099
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE060195BDF1;
	Fri, 25 Sep 2026 19:54:58 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1F06195604D;
	Fri, 25 Sep 2026 19:54:56 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Rich Felker <dalias@libc.org>
Cc: Trevor Gross <tg@trevorgross.com>,  Alejandro Colomar <alx@kernel.org>,
  linux-man@vger.kernel.org,  libc-alpha@sourceware.org,
  musl@lists.openwall.com
Subject: Re: [musl] [PATCH 2/2] man/man2/fork.2: Document glibc and musl
 relaxed fork->exec AS requirements
In-Reply-To: <20260923234714.GB23438@brightrain.aerifal.cx> (Rich Felker's
	message of "Wed, 23 Sep 2026 19:47:14 -0400")
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
	<20260923233818.25289-3-tg@trevorgross.com>
	<20260923234714.GB23438@brightrain.aerifal.cx>
Date: Fri, 25 Sep 2026 21:54:54 +0200
Message-ID: <lhuqzihxg1d.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

* Rich Felker:

>> +On glibc and musl libc, this is relaxed;
>> +it is safe to call non-async-signal-safe functions in the time between
>> +.BR fork ()
>> +and
>> +.BR exec ()
>> +\&.

> While glibc has taken measures to make this mostly work, especially
> malloc-after-fork, I don't think glibc has an intentional model for
> ensuring that arbitrary libc functions work right in the child of a
> multithreaded fork. Before accepting such a man page patch, we should
> at least get an official position from glibc on whether they claim
> this property or at least aim for it.

Far from everything in glibc is fork-protected, so the statement is not
true today as far as glibc is concerned.  We try to maintain
compatibility with existing application requirements, but the precise
goals have not been written down.

Thanks,
Florian

