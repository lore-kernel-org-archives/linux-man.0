Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2350D3A0E8D
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030436; cv=none; b=f3GoekuBSTqLu0bGWTwfSCgszYWaqCaDwkj0CSpvAyhsHlK5HeIjH4PjeRPmkIWKrkCbBpa2ELXp2WTsJxufc4NhntP4TwI9mCcD/QK2Y76b9R6WlGzRHaEW901S82WGkuJ1/3u4Uroi8KB6Fl74KtoNLACU1MXhiD30wWSxqdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030436; c=relaxed/simple;
	bh=ZMIrf3/pm8iyeC7Q4eRCkkY46KXl547OF5pWB3gj/aY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=nvYJVv7ZhF5GD6aq0aYSWQQRi1RtMClj70VMVQsmL89ajZN4sWlTqRKu47xQ/v/Duxo5/2D0tb1DvCVt5ODjANuqAHP0olnCX6w2R5FTBO1/iQvTupcoyUl+ppDZAA6a+GvCRr2i4zA5X4R4NmqJSoBGSuUiaOZ+FdYh2Y6QYiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvbtY/s0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvbtY/s0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786030434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=gKL1WJ7bFI7J74kfk4fmpSNs317EpcBvN3Jy9mIH6bI=;
	b=YvbtY/s0DGOvAXWUh0vMn+r79HgSaD776/tdIRey2o++tiAswLD7sWnXNb0RRUITQEKSSD
	m9L7e95+2OEgIy/C/TbK8BQtRxf17av5jqZW2trQUmX2Bm8bbsEsc3l3R8ixws+nuOSTUr
	Yjh0Yk1T4+0lbbAz36KbrC+0s0CGzsY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-XWl5JbDiPNKAhwQ9ybyp9Q-1; Thu,
 06 Aug 2026 11:33:50 -0400
X-MC-Unique: XWl5JbDiPNKAhwQ9ybyp9Q-1
X-Mimecast-MFC-AGG-ID: XWl5JbDiPNKAhwQ9ybyp9Q_1786030429
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C6341955F17;
	Thu,  6 Aug 2026 15:33:49 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D5E61800348;
	Thu,  6 Aug 2026 15:33:49 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 676FXl2g2147780;
	Thu, 6 Aug 2026 11:33:47 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <anSaCsgYGOPtoDJ8@devuan> (message from Alejandro Colomar on
 Thu, 6 Aug 2026 16:37:53 +0200)
Date: Thu, 06 Aug 2026 11:33:47 -0400
Message-ID: <xn8q6j461w.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Alejandro Colomar <alx@kernel.org> writes:
> A few minor comments below.

I'll defer a v5 until we finish discussing...

>> +The file may also contain
>> +.IR filters ,
>> +which limit the tunables following it,
>> +up to the end of the file
>> +(or end of the included file,
>> +or start of a new included file)
>
> I'd append within the parentheses:
> 	, whichever comes first

"first"?  Or "next"?

>> +or a line with only
>> +.B []
>> +on it.
>
> So, this is like an end-all-filters directive, right?
>
> I wonder something: Does a filter end previous filters, or do they
> compound until a [] ends them all?

There is only ever one filter active at a time.  It stops being the
active filter when another filter is encountered, or the current file
ends, or an include directive.  An empty filter spec (i.e. "[]") is a "no
filters" filter.  It acts as a "new filter" for the purpose of ending
the previous filter, but does not specify a new filter, so no new filter
is active after that.

If you can get that into five words or less, you win ;-)

>> +The syntax is:
>> +.P
>> +.in +4n
>> +.EX
>> +.RI [ filter : pattern ]
>
> Since '[', ':', and ']' are literal, let's put them in bold.  Thus, BI.

Done.

