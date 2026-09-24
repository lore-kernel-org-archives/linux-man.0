Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6DA44C645
	for <linux-man@vger.kernel.org>; Thu, 24 Sep 2026 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241726; cv=none; b=RcWI0b4fPLGZlzquYa2ToJHcykDvfJCLGlDZu0Duk3kPPu4lRl6394/TH15NUBVIzc1eW5Z0P4AVWbkKRZ1LWfORCicgsKjA/IYpJYi444ZSLjFjRUqfPK6rJk3R422fjv8OJt1h8WFbYRjmwF4JSrxuzsyTGp43Szk0bvVhGVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241726; c=relaxed/simple;
	bh=vj45IlW2zCNVUyVC7nDYxLC4+9GMMupaI75HclSbDSQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ogMwMUOsSrgUkxReLgPMY4sadzjjywAJ8vqIA49HMeKVhw14TII1ObIo4k2XarNFAE+Sp0ot6M15JLNClRETQA1C2NQYQAE6Of+If6IeP0UeU2oZikqWzhXZkelkvR1bkaAYy4pI0hZ4MbsP1R5WuuzDUadLkSZOryZIzAHp7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzAbCfmx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzAbCfmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790241721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vj45IlW2zCNVUyVC7nDYxLC4+9GMMupaI75HclSbDSQ=;
	b=PzAbCfmxMwB+VF7QXpfEzvslLT0XF74V7G/vUWBckl85lJ9h5fp44uHqwZ3b2jNVhtATAa
	9eSNIaH6a2zKHGGGLDL3xsvgsX0A2I0Q5wplOlxFSFfDa7+NIr+6ey37LnFo+yZT/uPk5R
	F2MnLTJxayvyRe/nmFX4ATp9pmRiXew=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-qo3y9nnaP0-h4WXQuQ2SNQ-1; Thu,
 24 Sep 2026 05:21:57 -0400
X-MC-Unique: qo3y9nnaP0-h4WXQuQ2SNQ-1
X-Mimecast-MFC-AGG-ID: qo3y9nnaP0-h4WXQuQ2SNQ_1790241716
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57C5C1977590;
	Thu, 24 Sep 2026 09:21:55 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F32441B;
	Thu, 24 Sep 2026 09:21:52 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Rich Felker <dalias@libc.org>
Cc: Trevor Gross <tg@trevorgross.com>,  musl@lists.openwall.com,
  linux-man@vger.kernel.org,  libc-alpha@sourceware.org
Subject: Re: [musl] Re: async-signal-safety of chroot
In-Reply-To: <20260924021222.GC23438@brightrain.aerifal.cx> (Rich Felker's
	message of "Wed, 23 Sep 2026 22:12:22 -0400")
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
	<20260923013428.GT23438@brightrain.aerifal.cx>
	<DLN4IBB6FV7K.WN3EVWC5FG17@trevorgross.com>
	<20260924021222.GC23438@brightrain.aerifal.cx>
Date: Thu, 24 Sep 2026 11:21:50 +0200
Message-ID: <lhuecejhump.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

* Rich Felker:

> musl makes clone roughly as safe as fork (see commit fa4a8abd06a4),
> and disallows flags that are not compatible with executing any part of
> libc in the child, but afaik glibc still has an anything-goes
> approach.

Yes, there is no filtering in glibc, and no update of the (shared) TCB.
Several web browsers longjmp out of the clone callback and patch the TCB
with the new TID, so that mutexes work as expected.

Thanks,
Florian

