Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F421F4181
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785632649; cv=none; b=M3KJTui0VknOMjWdOXQTRbujhJfFbgNbTT6XnGt8a4tgN5v9cv+UBg+HLX46rzOnkcD5e0MnYxE47k8y3E5DbUZyuLwxApBeXzVr8AO8uNz1roRnuWgHQRVBQI7Ja7WaZCi+5NsVqpr1jt8wp8cmBpnM2gsVPXxo3M7oYxrTurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785632649; c=relaxed/simple;
	bh=cnHHknXzjb0B3WgxuzoMNNJN+2l2c90EWjQJDKNeFmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rtNOqNHeq0H+MfW5tvTCCm6lXIqbGzTxqh4IaIAWdqyx84pfWBKouMArLZcVGl9xVCFh1rOFE2EMvHpOsEy0tONE+nQt/wJNTsHIlPw9Be71Hl8/RozzBx0QH4cpnssTPa0Wiui4rOPC8r0pwbNeuSjy3upk3NQjaZL7GVCKtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2h7q6vo; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2h7q6vo"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe431467e6so498712a12.1
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785632647; x=1786237447; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hBnmBZxeFP7bw9yWRUXALCq2/mOSz/uwdoUnluaVcoM=;
        b=D2h7q6voWhBauhhhx2CGg5YQZcbocSoXkEuPYoDDJUM1EB9sgf73j0fEMkG5HtFUK2
         wdE1sAMHbY236syCe9GzXXvKMdF6X2Q0buxWrdzPc5p2AZHR4KjbPfXKAaVxMk8BmU6h
         jkY4VNcjJzIkfgtIQw/kJr4rj0YP8bfnpFD4Ph5/h87t6ofBHRZyyuP7NpQnsIQ5JX3c
         kUY7zbWoufHYMSL57/Cp+Up0kpF/7qbpHUR7TW0k2mjuU5Pljlre6sqQo7rcO2mtS0GR
         MbcTx3pwDKVvFGh0kHl6JyX3Tl+2y0TNoaTctvFkDmLmyxw2cgG79xDpGO4mnbGojOh8
         X7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785632647; x=1786237447;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hBnmBZxeFP7bw9yWRUXALCq2/mOSz/uwdoUnluaVcoM=;
        b=WsXLrvUhBJfbRgFL9o21n9u5zwwETEL2Y3TlL6+q03mNk+YHqUG6TpwCaXcIgrZjTz
         0bj3S6neVS0SIFkA0i22KJeQ4bEOsnd1kiu0fL9d7mfRCR/CvFPZHoGfE0UMOobL+wU8
         lFauhGnl3YRhkykpZVbPWhPZMqodD4060Sbv97vLJtc83r1HMBUSHbGA0KoyQGpjun2w
         +y28NxieUSdwPbjGQZ/FhLjo/ScHz5zYlJbeAW6AkPVo2Z+51SJy44DoIVY7BRaBsrI6
         Y3ssumbBX/pSLzOMfh6x7ChTCndtR6MzCj76n8hIvYHgRE9Vo1OTKsYhHuRogkTXkrda
         +xnA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv0KWh8+kq9bgNXaDJ6A4aL6zgs4KgJAiPCLrTBondk1QtKDAWYXGQCtirutbv/X+uLioOqE0+R34=@vger.kernel.org
X-Gm-Message-State: AOJu0YylmkryW0d9Twp6gFf0Zseuk0cjhnanHN2UBZDlKlPxaZot3H96
	wBXNS2J99C5z5+qfJaLdmghYDNVaWwDN3HNl0nwT7JBbfBP70ZcURr5v
X-Gm-Gg: AR+sD10bATpZSJT8OfLRJ0afQ9ECaTXntJBEKPdPhBuZ69z5yTWA5443MV9CBPP4x2b
	utfBKoygDQ6OI2tAJ8KnHBhK2kQSq5wzufcfzM33j5Tr19SEf67gaFbtYUPz/sp5ezzO5ZpeGTI
	rbwideuAeOoYFVanKkVukA8z/4xdNNfiYTV5fLECgYSrcepKQOwIv5H0Xq/bwK/CHq6MQFOWh2d
	Lak/Cw2AIXqm+2PZ27nevYrsqwestPkwAw4uogdc+atIq91CeNb9OdgvIy8FJ2W/84LIvFW/jvx
	hdxm7DLMnqYSQ4b6It8jw6h4BcEu9S6T7JMOlBk6SIRP9kdOGSHDRgkZ2KcjudXyJnsE5qT1TEd
	N7o5/2VvfrtQhqrvUBPDcM9RIteRmG8/aLzPqqBc1nnsxC8h86Z8/AK3rrJr+g5kmRX5x59SN5W
	RcAN3LN1I8A6gK7XXiWHce4UPpgmxQ6Ct6l6LfWUSp
X-Received: by 2002:a05:6a20:7f85:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c91a7ad9f8mr7954429637.15.1785632647515;
        Sat, 01 Aug 2026 18:04:07 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::4bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm16034664c88.11.2026.08.01.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:04:06 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,  Paul Eggert
 <eggert@cs.ucla.edu>,  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <am6PkypxYg-Fq4Iz@devuan>
References: <cover.1785532392.git.alx@kernel.org> <3556566.BddDVKsqQX@cagnes>
	<am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes>
	<am56ZBzNM5J07AUa@devuan>
	<f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
	<am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid>
	<am6PkypxYg-Fq4Iz@devuan>
Date: Sat, 01 Aug 2026 18:04:05 -0700
Message-ID: <87cxw1s58a.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alejandro Colomar <alx@kernel.org> writes:

>> I'd like to underscore this point.  As I noted in my response to Doug,
>> the flagship book on C, as we all know, is stuck in 1988.  The throne is
>> vacant, with many pretenders, some with excellent cases for service as
>> regent.
>
> In fact, the throne might currently fall in the Linux man-pages project.
> While not being a blood heir of the Unix standards, it has become a
> de-facto standard.

I don't think anyone is arguing whether or not man-pages is an
educational tool. The argument is whether it should educate based on
current standards, or the maintainers preferences.

Collin
