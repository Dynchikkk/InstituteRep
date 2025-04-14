using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ShopApp.WebApi.Migrations
{
    /// <inheritdoc />
    public partial class AddTestField : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            _ = migrationBuilder.AddColumn<string>(
                name: "TestField",
                table: "Products",
                type: "TEXT",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            _ = migrationBuilder.DropColumn(
                name: "TestField",
                table: "Products");
        }
    }
}
