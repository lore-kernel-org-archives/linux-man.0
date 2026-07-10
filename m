Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121FC34405B
	for <linux-man@vger.kernel.org>; Fri, 10 Jul 2026 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721478; cv=none; b=CH0mjuxQFZx61lyFsd5jMWxOhmbMb0/fZYr0i8CzyaUjz0emGKF++V2iEH1ESEG56MB55t6QfHFk4RwUVovHt7iFNH+w+Cla4Grs67GxWjQvmKkFO++KKlUd54kBGI9A3yVXN/ZFo7s1M27yYcr/kwQ/KV2UgiF6Gg4tekJ3bGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721478; c=relaxed/simple;
	bh=M9ifkqPwLzkgPAKraaLFzMMy3znELkqr67jc8/SpQU8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=bY52+bH8yxc/iqsVr8KWEFa918KCpW9XAXOFEqByILvvyb8mPUsCooaGo39c2X6H7Vm071kS6eVDBJ7Fl28JywJ2HSyCwBE/kFnOGULJdZGgwoqcShZPJDKLmRI+sTHTtULLOispL2jPdfF0v226nF3d9Tlng+GFSNYNnB2b6jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SJ7Sl97z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SJ7Sl97z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783721476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=ifnMZ7JsFJ8PTBhqV33+JvWTAx025ajC/oaVABEkWQc=;
	b=SJ7Sl97zGxGzClTNYgHSGMthV06vqrTKUZBN55WyvpUgsr9U8K68MczN4mbn7LmE0TOBXo
	IIhiNpRWfdCjyuPo53bO0zeeat4mPUSyF9sg5R/kqQETdgcbrCU5IAEkTiIUugzbi01iIS
	hT16XYm5V8O8CzzJACaAvNB/mTdjk1U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-379-SLx_JE2BPWqKkx99HVZXEw-1; Fri,
 10 Jul 2026 18:11:12 -0400
X-MC-Unique: SLx_JE2BPWqKkx99HVZXEw-1
X-Mimecast-MFC-AGG-ID: SLx_JE2BPWqKkx99HVZXEw_1783721471
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BE3D1800603;
	Fri, 10 Jul 2026 22:11:11 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 07D90195608F;
	Fri, 10 Jul 2026 22:11:10 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66AMB90S778516;
	Fri, 10 Jul 2026 18:11:09 -0400
From: DJ Delorie <dj@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: Why we're stuck with man(7) (was: man/man8/ldconfig.8: document
 system-wide tunables)
In-Reply-To: <20260710195854.ud4riftmhrfzu54d@illithid>
 (g.branden.robinson@gmail.com)
Date: Fri, 10 Jul 2026 18:11:09 -0400
Message-ID: <xnpl0u8phe.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> * Markdown can't do semantics.

And roff has .IR ;-)

These days, most of the docs I write are in texinfo or HTML (raw html,
not markup).  I think I've experienced most of the formats on your list.
I think I've written converters between many things on your list.

Is there a canonical reference to the flavor of roff that we write to,
for modern systems' man page formatters?

