from django.db import models
# from django.utils import timezone

# Product model
# fields: name, price, original_price, specs, image, warranty, display_order
# TODO: add category field later (laptop / desktop / hdd / gpu)
# TODO: add stock quantity
# TODO: add created_at


class Product(models.Model):
    # product name
    # ex) Lenovo ThinkPad T14 Gen 1
    name = models.CharField(max_length=200)

    # selling price
    price = models.DecimalField(max_digits=10, decimal_places=2)
    # original price (before discount)
    # nullable because some products don't have discount
    original_price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    # ====== specs ======
    # cpu
    spec_cpu = models.CharField(max_length=100)
    # ram
    spec_ram = models.CharField(max_length=100)
    # ssd
    spec_ssd = models.CharField(max_length=100)
    # screen (for non-laptop items this stores form factor info)
    spec_screen = models.CharField(max_length=100)
    # ===================

    # image path
    # ex) img/laptop_placeholder_1.jpg
    image_path = models.CharField(max_length=255)

    # warranty period (default 1 month)
    warranty = models.CharField(max_length=50, default="Garantie 1 mois")

    # sort priority (higher number = shown first)
    display_order = models.IntegerField(default=0)

    # category = models.CharField(max_length=50, default='laptop')  # TODO use this later
    # stock = models.IntegerField(default=0)  # TODO
    # created_at = models.DateTimeField(auto_now_add=True)  # TODO

    def __str__(self):
        return self.name

    # not used right now but maybe later
    # FIXME: self.image doesn't exist - should be self.image_path
    def get_image_url(self):
        if self.image:
            return self.image.url
        else:
            return ''  # empty string when no image

    # def get_discount_percent(self):
    #     # TODO: calculate discount percentage
    #     if self.original_price:
    #         diff = self.original_price - self.price
    #         percent = (diff / self.original_price) * 100
    #         return int(percent)
    #     return 0

    # def is_on_sale(self):
    #     return self.original_price is not None and self.original_price > self.price
