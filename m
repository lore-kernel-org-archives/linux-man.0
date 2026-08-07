Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EC2F39B5
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 03:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786073136; cv=none; b=XmXE0g9sDf6iqH1YK/FmLAxLfusxTBuCv2QERK5a3fMHujTCHAZKgk1zQIR7CUYcXunSkuHNZu6dcuB+ikm+DYo83MXv6zn50Q+/UTr/eC7E/wPUQkBIk1m3PrK4K6Za1e81agi0pp6m3UWYLBFwxZe8oEVjMQRWhtNrftRfuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786073136; c=relaxed/simple;
	bh=GsW+tUEeRWgxlkTDzLKktpjX3iQw5T684YQ5xAHy6NQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=P3gl5bH1uDktyEL8jHm/5JUdDR1yIUPTfAwc0WCWqzx4jseMq8+aYcUIiuesH9CYFJhZZVKIDFCq5u08DVrBFDLxea3zrWAQxyXsDRmtItz/yfVy4C9yO+fDqakBAbEiRsMvSvPpotZyXBd/bq1j8aVcLtXjmWKODd+NOqq+ivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ep8TL2zQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ep8TL2zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786073134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=jkHN9Vi2WRtfHTn9B4KnCwFmnqrH2+cHGbAMfJpTjCw=;
	b=ep8TL2zQB7JnqQwCTafGI7xE5/nxG0KbrjrPbDzO+AXZ3AwWsNH1+UjOocQuUXdWNhdxFD
	HLRLT1byjMzN9WG5TxEsKUvLDJIEj4JejoplLvWfIUMmjlNyJVZveluA4I0BmaN1LmPV41
	mmtt7n3BY7AD2ZhPn87iLh8NNq0zjYw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-Xs8YQ-DrNeGgpWHwWbeOdQ-1; Thu,
 06 Aug 2026 23:25:32 -0400
X-MC-Unique: Xs8YQ-DrNeGgpWHwWbeOdQ-1
X-Mimecast-MFC-AGG-ID: Xs8YQ-DrNeGgpWHwWbeOdQ_1786073131
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 932E71800650;
	Fri,  7 Aug 2026 03:25:31 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5211C30001A2;
	Fri,  7 Aug 2026 03:25:31 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 6773PTIl3389650;
	Thu, 6 Aug 2026 23:25:29 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <anUbLZzOLY2qM6iP@devuan> (message from Alejandro Colomar on
 Fri, 7 Aug 2026 02:06:57 +0200)
Date: Thu, 06 Aug 2026 23:25:29 -0400
Message-ID: <xntsp6393q.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Alejandro Colomar <alx@kernel.org> writes:
> Hmmmmm, let's say you call execve(2) several times without any fork(2)s.
> Assuming a that the program paths that you pass to execve(2) are all
> dynamic ELF programs built with glibc, I guess for every time you call
> execve(2), ld.so(8) will be run, and the tunables stored in ld.so.cache
> will be used.  Is this correct?

I think this rabbit hole is too deep for this part of the man page.  We
need a short sentence that's obvious to the reader, not a diatribe on
how the linux kernel works.

I'm happy with something like "The resulting data is read when the
program starts." regardless of how ambiguous or technically incorrect it
might be ;-)

