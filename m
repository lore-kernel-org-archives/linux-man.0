Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA2493634
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787421132; cv=none; b=GVarVa5ScKt2hkshibH4Dc8jCFsrkYrzh95vBqd55zggr5VbS+PJ89KpbjpyJhwxKvu2EDZws8J0BU10Brlt08Te7qDY+IfmK93zQX1mHjnahJsrR9U4JWmxq7eUigmAu7eokyF1O05tGdeQhTrit3SizDcyBj6uzbwo44rDvIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787421132; c=relaxed/simple;
	bh=0YjvzaYtzsjeIzPsZhiDrQfkXxyE3IBtumNVAWr57P4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=sddXKDBEoIeUeYJ/zWdaNijLD6LnI+J60r5RMQuHOt5iv+a4QguLIaEi2USjrcv2i8FUq57tmK+kHZzCsUYpNWA0yJZVmIiVlrTu/GKL8yQGdI7eUzI0y7VBkBkyTo6eHEXbeugVg7J5rXb/TsqBKOKAYJHSNJ6M21iz0E5dzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a2RKbFUl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a2RKbFUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787421129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=tUOeyt/oteQof4pc0N2hO3nbBx48zxws6dyJzZOp69E=;
	b=a2RKbFUl8xLoyiK6S+SVFURpqVV2Vs+h2kxNEr9bKH81bP9VuJWxQZLCpIe+wsBYFdWEcz
	ll//BEB7g88nAIDx+rp6woaeKeq1tmV/pspZVX4iw+WDuom9F6g/kWzaq5W7rkj/tnVyJC
	5SxOpBDFLUNf4tuy4KlGoxBhQLW/HXU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-6nAyefh8PAyVjXSlG0FyPQ-1; Sat,
 22 Aug 2026 13:52:05 -0400
X-MC-Unique: 6nAyefh8PAyVjXSlG0FyPQ-1
X-Mimecast-MFC-AGG-ID: 6nAyefh8PAyVjXSlG0FyPQ_1787421124
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C648D1809C85;
	Sat, 22 Aug 2026 17:52:04 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 65337180059E;
	Sat, 22 Aug 2026 17:52:04 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 67MHq2qP374975;
	Sat, 22 Aug 2026 13:52:02 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <aonffTpk4ABQKkGH@devuan> (message from Alejandro Colomar on
 Sat, 22 Aug 2026 19:43:14 +0200)
Date: Sat, 22 Aug 2026 13:52:02 -0400
Message-ID: <xnbjau9h6l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Alejandro Colomar <alx@kernel.org> writes:
>> >> +.BI [ filter : pattern ]

> Hmmm, then let's say file.  Does that sound good to you?

I mean the "pattern" in the syntax, for this filter, must match the -
well, whatever we call /proc/self/exe (or if that's unavailable,
argv[0]) - for the process.  As noted, it must exactly match either the
entirety of /proc/self/exe or just the basename of it, depending.

So if you want to say "limits the following tunables to processes whose
file name (taken from /proc/self/exe) matches /pattern/" that's OK.

Saying "whose name matches the file" would be wrong, but I don't think
you meant that.

