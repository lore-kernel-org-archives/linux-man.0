Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D18493657
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787418147; cv=none; b=evRkYOf5cjilxnnDYVPtjhic7HPFY1e8RsD+eCkYdfoxJld5RSh5mKy+l9p4M2JhMSpojDRhUJSQlTUCiheqAR8w6fcEwzrd8RjuIaBf3nVo6x36O41Bgyo2XHpV2OW/1qXZpnIwkXnokWqcLn2M8n0u25CPqJA1M5aJgW9frYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787418147; c=relaxed/simple;
	bh=b5/yV1I5xW8X5VfQbQ/ki0b6CsXUbkUfZV8F3DR+Eu4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=EIDa6r+a0h4TJRF92E7G4I5EBKJUmdNr4lu71/tE4Se3iNABmCSkVNDYU/3tYQuBdJhjoxQL8uGcuBcIyNCpZY8lR8TiWtK3L+nqfQ4hxWJGyHpqpjAvo5a9sSFIC9DHgYP+9bta7uPDsLiyVmgridRpYQNXIOJyIRi8TkiY4so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5zOn/Da; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5zOn/Da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787418145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=Bc1eoUdEbMGAaIBoXQgepxQAoSkyFbnHJCn8sAHpa8o=;
	b=M5zOn/DaXp0o2zik6KnZvAxVe3pj6I7DTjsYnOL9vTKxJXCT5SYHwNre7tT/NrnZJoYtex
	umg39SGkWX4IrPzA1C/kvdTxq8rg2yYxC0uuhfiSuTOENa6u88u2LalWUmPoONPiJslqqa
	DnTomaC1/M0Aww9dw34Vt6q/GgxdI0M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-V43PG5s1P0K9b57r8NZ7nQ-1; Sat,
 22 Aug 2026 13:02:20 -0400
X-MC-Unique: V43PG5s1P0K9b57r8NZ7nQ-1
X-Mimecast-MFC-AGG-ID: V43PG5s1P0K9b57r8NZ7nQ_1787418139
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B433119560AA;
	Sat, 22 Aug 2026 17:02:19 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.30])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45DC430001A2;
	Sat, 22 Aug 2026 17:02:19 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 67MH2HFQ373137;
	Sat, 22 Aug 2026 13:02:17 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <aomtdXK5M19xrk0z@devuan> (message from Alejandro Colomar on
 Sat, 22 Aug 2026 16:10:34 +0200)
Date: Sat, 22 Aug 2026 13:02:17 -0400
Message-ID: <xnecfq9jhi.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Alejandro Colomar <alx@kernel.org> writes:
>> +.BI [ filter : pattern ]
>> +.EE
>> +.in
>> +.TP
>> +.B proc
>> +The
>> +.B proc
>> +filter limits the following tunables to processes
>> +whose name matches the pattern.
>
> Is this also a glob(7) pattern?  Or is it a literal name?

No, it matches /pattern/ exactly.

